#!/usr/bin/env nu
use std log
use inc.nu install_latest_github_release

export def bootstrap [] {
    log info "Setting up oh-my-posh"
    install_latest_github_release "JanDeDobbeleer/oh-my-posh" {
            'android/aarch64': {assetPattern: 'posh-linux-arm64', binName: 'oh-my-posh'},
        'linux/aarch64': {assetPattern: 'posh-linux-arm64', binName: 'oh-my-posh'},
        'linux/x86_64': {assetPattern: 'posh-linux-amd64', binName: 'oh-my-posh'},
    }
    mkdir ($nu.data-dir | path join "vendor/autoload")
    (^oh-my-posh init nu
        --config $"($env.HOME)/.config/oh-my-posh/themes/powerlevel10k_rainbow_vjftw.omp.json"
        --print | save -f ($nu.data-dir | path join "vendor/autoload/oh-my-posh.nu")
    )
}

def main [] {
    bootstrap
}
