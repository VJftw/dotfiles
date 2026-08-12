use std/log
use mise.nu
use nu.nu

export def bootstrap [] {
    mise write_conf_d "starship" {
        tools: {
            "starship": "latest"
        },
    }


    mise exec starship [
        starship, init, nu,
    ] | nu save_vendor_autoload starship

}

def main [] {
    bootstrap
}
