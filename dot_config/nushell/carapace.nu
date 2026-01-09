#!/usr/bin/env nu
use std log
use inc.nu install_latest_github_release

export def bootstrap [] {
    log info "Setting up Carapace completions"
    install_latest_github_release "carapace-sh/carapace-bin" {
        'android/aarch64': {assetPattern: 'carapace-bin_($v)_linux_arm64.tar.gz', archiveBinPathParts: ['carapace']},
        'linux/aarch64': {assetPattern: 'carapace-bin_($v)_linux_arm64.tar.gz', archiveBinPathParts: ['carapace']},
        'linux/x86_64': {assetPattern: 'carapace-bin_($v)_linux_amd64.tar.gz', archiveBinPathParts: ['carapace']},
    }
    $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
    mkdir ~/.cache/carapace
    carapace _carapace nushell | save -f ($nu.data-dir | path join "vendor/autoload/carapace.nu")
}

def main [] {
    bootstrap
}
