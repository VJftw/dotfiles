use std log

export def bootstrap [] {
    mise use --global carapace@latest

    mkdir ([$env.HOME, .cache, carapace] | path join)
    ^carapace _carapace nushell | save -f ([$nu.data-dir, vendor, autoload, carapace.nu] | path join)
    "$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'" | save --append ([$nu.data-dir, vendor, autoload, carapace.nu] | path join)
}

def main [] {
    bootstrap
}
