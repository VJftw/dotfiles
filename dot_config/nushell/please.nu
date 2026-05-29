use std log
use mise.nu
use nu.nu

export def bootstrap [] {
    mise write_conf_d "please" {
        tools: {
            "github:thought-machine/please": "latest"
        },
    }

    "@complete external
def --wrapped plz [...rest] {
  ^plz ...$rest
}

alias please = plz
" | nu save_vendor_autoload please
}

def main [] {
    bootstrap
}
