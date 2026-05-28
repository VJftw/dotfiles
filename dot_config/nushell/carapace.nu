use std log
use mise.nu

export def bootstrap [] {
    mise write_conf_d "carapace" {
        tools: {
            "carapace" : "latest"
        },
    }

    mkdir ([$env.HOME, .cache, carapace] | path join)
    ^carapace _carapace nushell | save -f ([$nu.data-dir, vendor, autoload, carapace.nu] | path join)
    "$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'" | save --append ([$nu.data-dir, vendor, autoload, carapace.nu] | path join)
}

def main [] {
    bootstrap
}
