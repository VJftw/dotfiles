#!/usr/bin/env nu
use std log
use inc.nu install_latest_github_release

install_latest_github_release "bazelbuild/buildtools" {
	'linux/aarch64': {assetPattern: 'buildifier-linux-arm64', binName: 'buildifier'},
	'linux/x86_64': {assetPattern: 'buildifier-linux-amd64', binName: 'buildifier'},
}

install_latest_github_release "bazelbuild/bazelisk" {
	'linux/aarch64': {assetPattern: 'bazelisk-linux-arm64', binName: 'bazel'},
	'linux/x86_64': {assetPattern: 'bazelisk-linux-amd64', binName: 'bazel'},
}
