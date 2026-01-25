if ! command -v bazel >/dev/null 2>&1; then
  return
fi

completionPath="$HOME/.bash_completion.d/bazel.bash"

if [ ! -f "$completionPath" ]; then
  bazel help completion bash >"$completionPath"
fi

source "$completionPath"

alias bzl='bazel'
