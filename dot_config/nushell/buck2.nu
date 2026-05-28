use std log
use mise.nu

export def bootstrap [] {
    mise write_conf_d "buck2" {
        tools: {
            "buck2" : "latest"
        },
    }

    const vendor_autoload_path = path self ([vendor, autoload, buck2.nu] | path join)
    cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, buck2.nu] | path join)
}

def main [] {
    bootstrap
}
