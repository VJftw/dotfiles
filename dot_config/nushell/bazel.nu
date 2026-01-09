#!/usr/bin/env nu
use std log
use github.nu

export def bootstrap [] {
	github install_from_config {
		owner: "bazelbuild",
		repo: "buildtools",
		# version: "", use latest
		binName: "buildifier",
		osArchConfigs: {
			"linux/x86_64": {assetPattern: "buildifier-linux-amd64"},
			"linux/aarch64": {assetPattern: "buildifier-linux-arm64"},
		}
	}

	github install_from_config {
		owner: "bazelbuild",
		repo: "bazelisk",
		# version: "", use latest
		binName: "bazel",
		osArchConfigs: {
			"linux/x86_64": {assetPattern: "bazelisk-linux-amd64"},
			"linux/aarch64": {assetPattern: "bazelisk-linux-arm64"},
		}
	}
}

def main [] {
    bootstrap
}
