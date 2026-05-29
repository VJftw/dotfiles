use std log
use mise.nu
use nu.nu

export def bootstrap [] {
    mise write_conf_d "kubectl" {
        tools: {
            "kubectl": "latest"
        },
    }

	"alias k = kubectl" | nu save_vendor_autoload kubectl
}

def main [] {
    bootstrap
}
