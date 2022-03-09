#!/usr/bin/env zsh

# This can be enabled by using `systemctl --user enable podman.socket && systemctl --user start podman.socket`
if [ -v XDG_RUNTIME_DIR ] && [ -S "${XDG_RUNTIME_DIR}/podman/podman.sock" ]; then
  export DOCKER_HOST="${XDG_RUNTIME_DIR}/podman/podman.sock"
fi
