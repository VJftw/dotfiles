if ! command -v kubectl >/dev/null 2>&1; then
  return
fi

completionPath="$HOME/.bash_completion.d/kubectl.bash"

if [ ! -f "$completionPath" ]; then
  kubectl completion bash >"$completionPath"
fi

source "$completionPath"

alias k='kubectl'
