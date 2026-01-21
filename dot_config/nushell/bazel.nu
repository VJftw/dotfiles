#!/usr/bin/env nu
use std log
use github.nu

export def install_buildifier [ ] {
 	let version = (github get_latest_release_tag "bazelbuild" "buildtools")
	github install_from_config {
		owner: "bazelbuild",
		repo: "buildtools",
		version: $"v($version)",
		binName: "buildifier",
		osArchConfigs: {
			"linux/x86_64": {assetPattern: "buildifier-linux-amd64"},
			"linux/aarch64": {assetPattern: "buildifier-linux-arm64"},
		}
	}
}

export def install_bazelisk [ ] {
	let version = (github get_latest_release_tag "bazelbuild" "bazelisk")
	github install_from_config {
		owner: "bazelbuild",
		repo: "bazelisk",
		version: $"v($version)",
		versionArg: "version",
		binName: "bazelisk",
		osArchConfigs: {
			"linux/x86_64": {assetPattern: "bazelisk-linux-amd64"},
			"linux/aarch64": {assetPattern: "bazelisk-linux-arm64"},
		}
	}

echo `
def --wrapped bazelisk [...rest] {
  ^bazelisk ...$rest
}

alias bazel = bazelisk
alias bzl = bazel
` | save -f ($nu.data-dir | path join "vendor/autoload/bazel.nu")
}

export def bootstrap [] {
	install_buildifier
	install_bazelisk
}

def main [] {
    bootstrap
}
