#!/usr/bin/env nu

use std log

let binPath = [ $env.HOME ".local" "bin" ] | path join
let thirdPartyPath = [ $binPath "third_party" ] | path join

log info $"($nu.os-info.name) (($nu.os-info.arch))"

def setup_micro [] {
	let version = "2.0.14"
	let os = $nu.os-info.name
	let arch = match $nu.os-info.arch {
		"aarch64" => 'arm64'
	}

	let releaseName = $"micro-($version)-($os)-($arch)"
	http get $"https://github.com/zyedidia/micro/releases/download/v($version)/($releaseName).tar.gz" | save --progress $"($releaseName).tar.gz"
	let extractDir = [ $thirdPartyPath "github.com" "zyedidia" "micro" ] | path join
	mkdir $extractDir
	^tar -C $extractDir -xzf $"($releaseName).tar.gz"
	rm -f ([ $binPath "micro" ] | path join) $"($releaseName).tar.gz"
	^ln -s ([ $extractDir $"micro-($version)" "micro" ] | path join) ([$binPath "micro"] | path join)

	log info $"installed micro ($version)"
}

def setup_gh [] {
	let version = "2.72.0"
	let os = $nu.os-info.name
	let arch = match $nu.os-info.arch {
		"aarch64" => "arm64"
	}

	let releaseName = $"gh_($version)_($os)_($arch)"
	
	http get $"https://github.com/cli/cli/releases/download/v($version)/($releaseName).tar.gz" | save --progress $"($releaseName).tar.gz"
	let extractDir = [ $thirdPartyPath "github.com" "cli" "cli" ] | path join
	mkdir $extractDir
	^tar -C $extractDir -xzf $"($releaseName).tar.gz"
	rm -f ([ $binPath "gh" ] | path join) $"($releaseName).tar.gz"
	^ln -s ([ $extractDir $releaseName "bin" "gh" ] | path join) ([$binPath "gh"] | path join)

	log info $"installed gh ($version)"

	(^gh auth login
		--skip-ssh-key
		--git-protocol https
		--web)
}

def setup_asdfvm [] {
	
}

def setup_starship [] {
	
}


setup_micro
setup_gh
setup_asdfvm
setup_starship
