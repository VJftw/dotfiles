use std log

export def bootstrap [] {
    mise use --global kubectl@latest

	const vendor_autoload_path = path self ([vendor, autoload, kubectl.nu] | path join)
    cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, kubectl.nu] | path join)
}

def main [] {
    bootstrap
}
