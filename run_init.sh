#!/usr/bin/env bash
set -Eeuo pipefail

binPath="$HOME/.local/bin"
export PATH="$binPath:$PATH"

if ! command -v mise >/dev/null 2>&1; then
  curl https://mise.run | MISE_INSTALL_PATH="$binPath/mise" sh
fi

mise use --global github:nushell/nushell
mise tool-alias set nu github:nushell/nushell

mise exec nu -- nu --commands 'mise activate nu --shims | save --force ([$nu.data-dir, vendor, autoload, mise.nu] | path join)'
mise exec nu -- nu ~/.config/nushell/bootstrap.nu

printf 'Use\n\tmise exec nu -- nu\n'
