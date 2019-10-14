# For tilix
source "${HOME}/.profile"

if [[ $TILIX_ID ]]; then
  source /etc/profile.d/vte.sh
fi

export ZSH=$HOME/.oh-my-zsh

plugins=(
  git
  command-not-found
  kubectl
  golang 
)

# Powerlevel9k Theme
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs kubecontext)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
DEFAULT_USER=$(whoami)
ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

export PATH="${PATH}:${HOME}/go/bin"

export EDITOR=vim
