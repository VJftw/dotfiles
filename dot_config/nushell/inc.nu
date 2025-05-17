use std log

export def install_latest_github_release [ownerRepo: string osArchConfigs: record] {
    let binPath = [ $env.HOME ".local" "bin" ] | path join
    let thirdPartyPath = [ $binPath "third_party" ] | path join

	let ownerRepoParts = $ownerRepo | split row '/'
	let owner: string = $ownerRepoParts | get 0
	let repo: string = $ownerRepoParts | get 1


	let osArch = $"($nu.os-info.name)/($nu.os-info.arch)"
	let osArchConfig: record = $osArchConfigs | get $osArch
	if $osArchConfig == null {
		error make {msg: $'($osArch) is unsupported'}
	}

	let version: string = (
		http get $"https://api.github.com/repos/($ownerRepo)/releases/latest"
		| get tag_name
		| str trim --left --char 'v' # strip any 'v' prefix to get only the version numbers.
	)

	let assetName: string = $osArchConfig.assetPattern | str replace '($v)' $version

	rm -f $assetName
	http get $"https://github.com/($ownerRepo)/releases/download/v($version)/($assetName)" | save --progress $assetName

	if $osArchConfig.archiveBinPathParts? != null {
		let extractDir = [ $thirdPartyPath "github.com" $owner $repo $version ] | path join
		mkdir $extractDir
		^tar -C $extractDir -xzf $assetName

		let binName: string = $osArchConfig.archiveBinPathParts | last
		rm -f ([ $binPath $binName ] | path join) $assetName
		let renderedarchiveBinPathParts: list<string> = $osArchConfig.archiveBinPathParts | each {
			|part| $part | str replace '($v)' $version
		}

		let extractedBinPath: string = ([ $extractDir ] | append $renderedarchiveBinPathParts | path join)
		let installPath: string = ([$binPath $binName] | path join)
		^ln -s $extractedBinPath $installPath
		try {
			^$binName --version | complete
		} catch {
			error make {msg: $"invalid installation of ($ownerRepo)
		Extracted Binary Path: ($extractedBinPath)

		Please verify binary exists at above path.
			"}
		}
	} else {
		let binName: string = $osArchConfig.binName
		let installedPath: string = [ $thirdPartyPath "github.com" $owner $repo $version $binName ] | path join
		mkdir ($installedPath | path dirname)
		mv $assetName $installedPath
		^chmod +x $installedPath
		rm -f ([ $binPath $binName ] | path join)

		let installPath: string = ([$binPath $binName] | path join)
		^ln -s $installedPath $installPath
		try {
			^$binName --version | complete
		} catch {
			error make {msg: $"invalid installation of ($ownerRepo)
		Installed Binary Path: ($installedPath)

		Please verify binary exists at above path.
			"}
		}
	}

	log info $"installed ($ownerRepo) (($version))"
}
