use std log
use mise.nu

export def bootstrap [] {
    mise write_conf_d "kubectl" {
        tools: {
            "kubectl": "latest"
        },
    }

	const vendor_autoload_path = path self ([vendor, autoload, kubectl.nu] | path join)
    cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, kubectl.nu] | path join)
}

def main [] {
    bootstrap
}
