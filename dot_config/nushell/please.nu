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

    const vendor_autoload_path = path self ([vendor, autoload, please.nu] | path join)
    cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, please.nu] | path join)
}

def main [] {
    bootstrap
}
