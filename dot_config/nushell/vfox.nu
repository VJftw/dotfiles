use std log
use github.nu

export def bootstrap [] {
    let version = (github get_latest_release_tag "version-fox" "vfox")
	github install_from_config {
		owner: "version-fox",
		repo: "vfox",
		binName: "vfox",
        version: $"v($version)"
		osArchConfigs: {
			"linux/x86_64": {
                assetPattern: $"vfox_($version)_linux_x86_64.tar.gz",
                extractWithEntrypoint: $"vfox_($version)_linux_x86_64/vfox",
            },
			"linux/aarch64": {
                assetPattern: $"vfox_($version)_linux_aarch64.tar.gz",
                extractWithEntrypoint: $"vfox_($version)_linux_aarch64/vfox",
            },
		}
	}
}

def main [] {
    bootstrap
}
