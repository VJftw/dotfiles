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

    const vendor_autoload_path = path self ([vendor, autoload, buck2.nu] | path join)
    cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, buck2.nu] | path join)
}

def main [] {
    bootstrap
}
