#!/usr/bin/env nu
use std log
use github.nu

export def bootstrap [] {
    let version = (github get_newest_release_tag "thought-machine" "please")
    github install_from_config {
		owner: "thought-machine",
		repo: "please",
		binName: "plz",
        version: $"v($version)",
		osArchConfigs: {
			"linux/x86_64": {
                assetPattern: $"please_($version)_linux_amd64.tar.gz",
                extractWithEntrypoint: "please/please",
            },
			"linux/aarch64": {
                assetPattern: $"please_($version)_linux_arm64.tar.gz",
                extractWithEntrypoint: "please/please",
            },
		}
	}

echo `
def --wrapped plz [...rest] {
  ^plz ...$rest
}

alias please = plz
` | save -f ($nu.data-dir | path join "vendor/autoload/please.nu")
}

def main [] {
    bootstrap
}
