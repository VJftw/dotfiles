#!/usr/bin/env fish

set --export KUBECONFIG "$HOME/.kube/config"

if [ -d "$HOME/.kube/configs" ]

  set -l kube_configs (find "$HOME/.kube/configs" -type f)

  for kube_config in $kube_configs
    set --export KUBECONFIG "$kube_config" "$KUBECONFIG"
  end

end

