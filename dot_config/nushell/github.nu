#!/usr/bin/env nu
use std log
use inc.nu install_latest_github_release

install_latest_github_release "cli/cli" {
	'linux/aarch64': {assetPattern: 'gh_($v)_linux_arm64.tar.gz', archiveBinPathParts: ['gh_($v)_linux_arm64', 'bin', 'gh']},
	'linux/x86_64': {assetPattern: 'gh_($v)_linux_amd64.tar.gz', archiveBinPathParts: ['gh_($v)_linux_amd64', 'bin', 'gh']},
}

^gh auth setup-git

let ghAuthStatus = ^gh auth status | complete
if ghAuthStatus.exit_code == 1 {
	(^gh auth login
	--skip-ssh-key
	--git-protocol https
	--web)
}
