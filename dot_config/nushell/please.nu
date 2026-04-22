use std log

export def bootstrap [] {
    mise use --global github:thought-machine/please

    const vendor_autoload_path = path self ([vendor, autoload, please.nu] | path join)
    cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, please.nu] | path join)
}

def main [] {
    bootstrap
}
