#!/bin/bash
set -euo pipefail

curl -L \
    "https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64" \
    -o "${HOME}/.local/bin/kind"
chmod +x "${HOME}/.local/bin/kind"
