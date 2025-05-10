#!/usr/bin/env nu

use std log

let binPath = [ $env.HOME ".local" "bin" ] | path join
let thirdPartyPath = [ $binPath "third_party" ] | path join

log info $"($nu.os-info.name) (($nu.os-info.arch))"

def install_latest_github_release [ownerRepo: string osArchConfigs: record] {
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

install_latest_github_release "carapace-sh/carapace-bin" {
	'linux/aarch64': {assetPattern: 'carapace-bin_($v)_linux_arm64.tar.gz', archiveBinPathParts: ['carapace']},
	'linux/x86_64': {assetPattern: 'carapace-bin_($v)_linux_amd64.tar.gz', archiveBinPathParts: ['carapace']},
}
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
mkdir ~/.cache/carapace
carapace _carapace nushell | save -f ($nu.data-dir | path join "vendor/autoload/carapace.nu")

install_latest_github_release "zyedidia/micro" {
	'linux/aarch64': {assetPattern: 'micro-($v)-linux-arm64.tar.gz', archiveBinPathParts: ['micro-($v)', 'micro']},
	'linux/x86_64': {assetPattern: 'micro-($v)-linux64.tar.gz', archiveBinPathParts: ['micro-($v)', 'micro']},
}

install_latest_github_release "cli/cli" {
	'linux/aarch64': {assetPattern: 'gh_($v)_linux_arm64.tar.gz', archiveBinPathParts: ['gh_($v)_linux_arm64', 'bin', 'gh']},
	'linux/x86_64': {assetPattern: 'gh_($v)_linux_amd64.tar.gz', archiveBinPathParts: ['gh_($v)_linux_amd64', 'bin', 'gh']},
}

let ghAuthStatus = ^gh auth status | complete
if ghAuthStatus.exit_code == 1 {
	(^gh auth login
	--skip-ssh-key
	--git-protocol https
	--web)
}

install_latest_github_release "version-fox/vfox" {
	'linux/aarch64': {assetPattern: 'vfox_($v)_linux_aarch64.tar.gz', archiveBinPathParts: ['vfox_($v)_linux_aarch64', 'vfox']},
	'linux/x86_64': {assetPattern: 'vfox_($v)_linux_x86_64.tar.gz', archiveBinPathParts: ['vfox_($v)_linux_x86_64', 'vfox']},
}

install_latest_github_release "JanDeDobbeleer/oh-my-posh" {
	'linux/aarch64': {assetPattern: 'posh-linux-arm64', binName: 'oh-my-posh'},
	'linux/x86_64': {assetPattern: 'posh-linux-amd64', binName: 'oh-my-posh'},
}
mkdir ($nu.data-dir | path join "vendor/autoload")
(^oh-my-posh init nu
	--config $"($env.HOME)/.config/oh-my-posh/themes/powerlevel10k_rainbow_vjftw.omp.json"
	--print | save -f ($nu.data-dir | path join "vendor/autoload/oh-my-posh.nu")
)
