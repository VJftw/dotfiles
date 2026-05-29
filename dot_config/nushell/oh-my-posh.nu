use std log
use mise.nu
use nu.nu

export def bootstrap [] {
    mise write_conf_d "oh-my-posh" {
        tools: {
            "oh-my-posh": "latest"
        },
    }


    mise exec oh-my-posh [
        oh-my-posh, init, nu,
        --config, ([$env.HOME, .config, oh-my-posh, themes, powerlevel10k_rainbow_vjftw.omp.json] | path join),
        --print
    ] | nu save_vendor_autoload oh-my-posh

}

def main [] {
    bootstrap
}
