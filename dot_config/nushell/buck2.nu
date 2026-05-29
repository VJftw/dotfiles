use std log
use mise.nu
use nu.nu

export def bootstrap [] {
    mise write_conf_d "buck2" {
        tools: {
            "buck2" : "latest"
        },
    }

    "@complete external
def --wrapped buck2 [...rest] {
  ^buck2 ...$rest
}
" | nu save_vendor_autoload buck2
}

def main [] {
    bootstrap
}
