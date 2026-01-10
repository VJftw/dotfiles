#!/usr/bin/env nu
use std log
use github.nu

export def bootstrap [] {
    let version = (github get_latest_release_tag "carapace-sh" "carapace-bin")
    github install_from_config {
		owner: "carapace-sh",
		repo: "carapace-bin",
		# binName: "carapace",
        version: $"v($version)"
		osArchConfigs: {
			"linux/x86_64": {
                assetPattern: $"carapace-bin_($version)_linux_amd64.tar.gz",
                extractWithEntrypoint: "carapace",
            },
			"linux/aarch64": {
                assetPattern: $"carapace-bin_($version)_linux_arm64.tar.gz",
                extractWithEntrypoint: "carapace",
            },
		}
	}

    $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
    mkdir ~/.cache/carapace
    carapace _carapace nushell | save -f ($nu.data-dir | path join "vendor/autoload/carapace.nu")
}

def main [] {
    bootstrap
}
