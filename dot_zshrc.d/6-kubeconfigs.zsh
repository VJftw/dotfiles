#!/usr/bin/env zsh

export KUBECONFIG="$HOME/.kube/config"

if [ -d "$HOME/.kube/configs" ]; then
    for f in $(ls "$HOME/.kube/configs" | sort); do
        export KUBECONFIG=$KUBECONFIG:$f
    done
fi
