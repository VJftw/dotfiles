#!/usr/bin/env sh
set -xe

NUSHELL_VERSION="0.104.0"
curl -L \
  -o "nu-${NUSHELL_VERSION}-x86_64-unknown-linux-gnu.tar.gz" \
  "https://github.com/nushell/nushell/releases/download/${NUSHELL_VERSION}/nu-${NUSHELL_VERSION}-x86_64-unknown-linux-gnu.tar.gz"

mkdir -p "$HOME/third_party/github.com/nushell/nushell/${NUSHELL_VERSION}"
tar -C "$HOME/third_party/github.com/nushell/nushell/${NUSHELL_VERSION}" -xvzf "nu-${NUSHELL_VERSION}-x86_64-unknown-linux-gnu.tar.gz"

mkdir -p "$HOME/.local/bin"
ln -s "$HOME/third_party/github.com/nushell/nushell/${NUSHELL_VERSION}/nu-${NUSHELL_VERSION}-x86_64-unknown-linux-gnu/nu" "$HOME/.local/bin/nu" || true

# TODO (in nushell):
# - Micro (text-editor) TODO: migrate to nu.
mkdir -p "$HOME/third_party/github.com/zyedidia/micro"
cd "$HOME/third_party/github.com/zyedidia/micro"
curl https://getmic.ro | bash
ln -s "$HOME/third_party/github.com/zyedidia/micro/micro" "$HOME/.local/bin/micro" || true

"$HOME/.local/bin/nu"

# - Starship.rs
# - ASDF-VM



