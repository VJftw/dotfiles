#!/usr/bin/env zsh

export KUBECONFIG="$HOME/.kube/config"

if [ -d "$HOME/.kube/configs" ]; then
    kubeConfigs=($(find "$HOME/.kube/configs" -type f))
    for f in "${kubeConfigs[@]}"; do
        export KUBECONFIG="$KUBECONFIG:$f"
    done
fi
