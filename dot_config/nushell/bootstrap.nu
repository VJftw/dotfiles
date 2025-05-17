#!/usr/bin/env nu
use std log
use inc.nu install_latest_github_release

log info "Setting up oh-my-posh"
install_latest_github_release "JanDeDobbeleer/oh-my-posh" {
	'linux/aarch64': {assetPattern: 'posh-linux-arm64', binName: 'oh-my-posh'},
	'linux/x86_64': {assetPattern: 'posh-linux-amd64', binName: 'oh-my-posh'},
}
mkdir ($nu.data-dir | path join "vendor/autoload")
(^oh-my-posh init nu
	--config $"($env.HOME)/.config/oh-my-posh/themes/powerlevel10k_rainbow_vjftw.omp.json"
	--print | save -f ($nu.data-dir | path join "vendor/autoload/oh-my-posh.nu")
)

log info "Setting up Carapace completions"
install_latest_github_release "carapace-sh/carapace-bin" {
	'linux/aarch64': {assetPattern: 'carapace-bin_($v)_linux_arm64.tar.gz', archiveBinPathParts: ['carapace']},
	'linux/x86_64': {assetPattern: 'carapace-bin_($v)_linux_amd64.tar.gz', archiveBinPathParts: ['carapace']},
}
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
mkdir ~/.cache/carapace
carapace _carapace nushell | save -f ($nu.data-dir | path join "vendor/autoload/carapace.nu")

log info "Setting up Micro text-editor"
install_latest_github_release "zyedidia/micro" {
	'linux/aarch64': {assetPattern: 'micro-($v)-linux-arm64.tar.gz', archiveBinPathParts: ['micro-($v)', 'micro']},
	'linux/x86_64': {assetPattern: 'micro-($v)-linux64.tar.gz', archiveBinPathParts: ['micro-($v)', 'micro']},
}
