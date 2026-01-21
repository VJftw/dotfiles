use std log


export def install_from_config [config: record] {
	let owner = $config.owner
	let repo = $config.repo
	let osArchConfigs = $config.osArchConfigs
	let versionArg: string = if $config.versionArg? != null { $config.versionArg } else { "--version" }
	let binPath = [ $env.HOME ".local" "bin" ] | path join


	let osArch = $"($nu.os-info.name)/($nu.os-info.arch)"
	let osArchConfig: record = $osArchConfigs
		| get $osArch
	if $osArchConfig == null {
		error make {msg: $'($osArch) is unsupported'}
	}

	let version: string = if $config.version? != null { $config.version } else {
		get_latest_release_tag $owner $repo
	}

	let binName = if $config.binName? != null { $config.binName } else {
		($osArchConfig.extractWithEntrypoint | str replace '($v)' $version) | path split | last
	}

	let binPath = [ $binPath, $binName ] | path join
	if ($binPath | path exists) {
		let versionRegex = if $config.versionRegex? != null { (['(', $config.versionRegex, ')'] | str join) } else { '(\d+\.\d+\.\d+)' }
		let currentVersion = ^$binPath $versionArg | complete | get stdout | parse --regex $versionRegex | first | get --optional capture0 | default 'none'
		log info $"version: ($version)"
		let parsedVersion = $version | parse --regex $versionRegex | first | get --optional capture0 | default 'none'
		log info $"latest ($binName) version: ($parsedVersion) \(current: ($currentVersion)\)"

		if ($parsedVersion == $currentVersion) {
			return
		}
	}

	let assetPattern = $osArchConfig.assetPattern
	let assetName: string = $assetPattern
		| str replace '($v)' $version

	let downloadedAssetPath = download_release_asset $owner $repo $version $assetName

	let entrypointPath = if $osArchConfig.extractWithEntrypoint? != null {
		extract_with_entrypoint $downloadedAssetPath ($osArchConfig.extractWithEntrypoint | str replace '($v)' $version)
	} else {
		$downloadedAssetPath
	}

	install_entrypoint_as $entrypointPath $binName $versionArg
}

export def get_latest_release_tag [owner: string, repo: string]: nothing -> string {
	http get $"https://api.github.com/repos/($owner)/($repo)/releases/latest"
	| get tag_name
	| str trim --left --char 'v' # strip any 'v' prefix to get only the version numbers.
}

export def get_newest_release_tag [owner: string, repo: string]: nothing -> string {
	http get $"https://api.github.com/repos/($owner)/($repo)/releases"
	| first
	| get tag_name
	| str trim --left --char 'v' # strip any 'v' prefix to get only the version numbers.
}

export def download_release_asset [
	owner: string, repo: string, version: string, assetName: string,
]: nothing -> string {
	let thirdPartyPath = [ $env.HOME ".local" "third_party" "github.com" ] | path join

	let downloadPath = [ $thirdPartyPath $owner $repo $version $assetName ]
		| path join
	mkdir ($downloadPath | path dirname)

	rm -f $downloadPath
	http get $"https://github.com/($owner)/($repo)/releases/download/($version)/($assetName)"
		| save --progress $downloadPath

	log info $"downloaded to ($downloadPath)"

	return $downloadPath
}

export def extract_with_entrypoint [archivePath: string, entrypoint: string]: nothing -> string {
	let extractDir = $"($archivePath)_extracted"
	log info $"creating ($extractDir)"

	rm -rf $extractDir
	mkdir $extractDir

	if ($archivePath | str ends-with ".tar.gz") {
		^tar -C $extractDir -xzf $archivePath
	} else if ($archivePath | str ends-with ".tar.xz") {
		^tar -C $extractDir -xf $archivePath
	} else if ($archivePath | str ends-with ".zst") {
		^unzstd --output-dir-flat $extractDir $archivePath
	} else {
		error make {msg: $"Unsupported archive ($archivePath)"}
	}

	log info $"extracted to ($extractDir)"

	return ([ $extractDir $entrypoint ] | path join)
}

export def install_entrypoint_as [ entrypointPath: string, binName: string, versionArg: string ] {
	let binPath = [ $env.HOME ".local" "bin" ] | path join
	let installPath: string = ([$binPath $binName] | path join)

	^chmod +x $entrypointPath

	rm -f $installPath
	^ln -s $entrypointPath $installPath
	log info $"linked ($installPath) to ($entrypointPath)"

	try {
		^$binName $versionArg | complete
	} catch {
		error make {msg: $"invalid installation of ($binName)
	Entrypoint Path: ($entrypointPath)

	Please verify binary exists at above path.
		"}
	}
}
