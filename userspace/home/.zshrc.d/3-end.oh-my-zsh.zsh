plugins+=(
  git
  command-not-found
  zsh-syntax-highlighting
  k # must come before kubectl
  kubectl
  golang
  colorize
  docker
  pip
  lol
  minikube
  zsh-256color
  aws
)
alias l='\k' # re-alias 'supercrabtree/k' as `l` as kubectl plugin uses `k`

echo "${plugins}"

source "${ZSH}/oh-my-zsh.sh"
