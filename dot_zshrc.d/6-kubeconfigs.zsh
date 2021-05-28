export KUBECONFIG="$HOME/.kube/config"
for f in $HOME/.kube/configs/*.yaml; do
    export KUBECONFIG=$KUBECONFIG:$f
done
