use std log
use github.nu

export def bootstrap [] {
	github install_from_config {
		owner: "helix-editor",
		repo: "helix",
		binName: "hx",
		osArchConfigs: {
			"linux/x86_64": {
                assetPattern: "helix-($v)-x86_64-linux.tar.xz",
                extractWithEntrypoint: "helix-($v)-x86_64-linux/hx",
            },
			"linux/aarch64": {
                assetPattern: "helix-($v)-aarch64-linux.tar.xz",
                extractWithEntrypoint: "helix-($v)-aarch64-linux/hx",
            },
		}
	}

	const vendor_autoload_path = path self ([vendor, autoload, hx.nu] | path join)
    cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, hx.nu] | path join)
}

def main [] {
    bootstrap
}
