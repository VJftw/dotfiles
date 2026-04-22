use std log

export def bootstrap [] {
    mise use --global github:helix-editor/helix

	const vendor_autoload_path = path self ([vendor, autoload, hx.nu] | path join)
    cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, hx.nu] | path join)
}

def main [] {
    bootstrap
}
