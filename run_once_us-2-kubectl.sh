#!/bin/bash
set -euo pipefail

latest_version=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
curl -L \
    "https://storage.googleapis.com/kubernetes-release/release/${latest_version}/bin/linux/amd64/kubectl" \
    -o "${HOME}/.local/bin/kubectl"
chmod +x "${HOME}/.local/bin/kubectl"
