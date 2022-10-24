#!/usr/bin/env zsh

# This can be enabled by using `systemctl --user start docker.service`
if [ -v XDG_RUNTIME_DIR ] && [ -S "${XDG_RUNTIME_DIR}/docker.sock" ]; then
  export DOCKER_HOST="unix://${XDG_RUNTIME_DIR}/docker.sock"
fi
