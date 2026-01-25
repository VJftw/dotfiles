#!/usr/bin/env bash
set -Eeuo pipefail

git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git "$HOME/.ble.sh"
make -C "$HOME/.ble.sh"
