#!/usr/bin/env nu
use std log
use github.nu

export def bootstrap [] {
    let version = (github get_newest_release_tag "facebook" "buck2")
    github install_from_config {
		owner: "facebook",
		repo: "buck2",
		binName: "buck2",
        version: $version,
        versionRegex: '\d+\-\d+\-\d+',
		osArchConfigs: {
			"linux/x86_64": {
                assetPattern: "buck2-x86_64-unknown-linux-gnu.zst",
                extractWithEntrypoint: "buck2-x86_64-unknown-linux-gnu",
            },
			"linux/aarch64": {
                assetPattern: "buck2-aarch64-unknown-linux-gnu.zst",
                extractWithEntrypoint: "buck2-aarch64-unknown-linux-gnu",
            },
		}
	}

echo `
def --wrapped buck2 [...rest] {
  ^buck2 ...$rest
}
` | save -f ($nu.data-dir | path join "vendor/autoload/buck2.nu")
}

def main [] {
    bootstrap
}
