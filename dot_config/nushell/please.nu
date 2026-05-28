use std log
use mise.nu

export def bootstrap [] {
    mise write_conf_d "please" {
        tools: {
            "github:thought-machine/please": "latest"
        },
    }

    const vendor_autoload_path = path self ([vendor, autoload, please.nu] | path join)
    cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, please.nu] | path join)
}

def main [] {
    bootstrap
}
