use std log
use mise.nu
use nu.nu

export def bootstrap [] {
    mise write_conf_d "carapace" {
        tools: {
            "carapace" : "latest"
        },
    }

    mkdir ([$env.HOME, .cache, carapace] | path join)
    let carapace_autoload = mise exec carapace [carapace, _carapace, nushell] | complete | get stdout
    "$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'" + "\n" + $carapace_autoload | nu save_vendor_autoload carapace
}

def main [] {
    bootstrap
}
