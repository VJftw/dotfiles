use std log

export def bootstrap [] {
    mise use --global oh-my-posh@latest

    (^oh-my-posh init nu
        --config ([$env.HOME, .config, oh-my-posh, themes, powerlevel10k_rainbow_vjftw.omp.json] | path join)
        --print |
        save -f ([$nu.data-dir, vendor, autoload, oh-my-posh.nu] | path join)
    )
}

def main [] {
    bootstrap
}
