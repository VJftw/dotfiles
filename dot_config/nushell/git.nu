#!/usr/bin/env nu
use std log
use github.nu

export def ensure_local_gitconfig_property [property: string] {
    let existingValue = (^git config get -f ~/.local.gitconfig $property)
    if ($existingValue | is-empty) {
        log info $'Enter new value for ($property) in ~/.local.gitconfig:'
        let value = (input)
        ^git config set -f ~/.local.gitconfig $property $value
    } else {
        log info $'($property) already set in ~/.local.gitconfig as "($existingValue)"'
    }
}

export def bootstrap [] {
    ensure_local_gitconfig_property "user.name"
    ensure_local_gitconfig_property "user.email"

    let version = (github get_latest_release_tag "hickford" "git-credential-oauth")
    github install_from_config {
		owner: "hickford",
		repo: "git-credential-oauth",
        version: $"v($version)"
        versionArg: "version",
		osArchConfigs: {
			"linux/x86_64": {
                assetPattern: $"git-credential-oauth_($version)_linux_amd64.tar.gz",
                extractWithEntrypoint: "git-credential-oauth",
            },
			"linux/aarch64": {
                assetPattern: $"git-credential-oauth_($version)_linux_arm64.tar.gz",
                extractWithEntrypoint: "git-credential-oauth",
            },
		}
	}

    if (^git config -f ~/.local.gitconfig --get-all credential.helper | lines -s | where $it == "oauth" | is-empty) {
        ^git config -f ~/.local.gitconfig --add credential.helper oauth
    }
}

def main [] {
    bootstrap
}
