use std log

export def bootstrap [] {
    mise use --global buck2@latest

    const vendor_autoload_path = path self ([vendor, autoload, buck2.nu] | path join)
    cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, buck2.nu] | path join)
}

def main [] {
    bootstrap
}
