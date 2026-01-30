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

	const vendor_autoload_path = path self ([vendor, autoload, bazel.nu] | path join)
    cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, bazel.nu] | path join)
}

export def bootstrap [] {
	install_buildifier
	install_bazelisk
}

def main [] {
    bootstrap
}
