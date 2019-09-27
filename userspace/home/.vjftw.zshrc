# For tilix
if [[ $TILIX_ID ]]; then
  source /etc/profile.d/vte.sh
fi

source "${HOME}/.profile"
source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle kubectl
antigen bundle golang
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle djui/alias-tips

# Powerlevel9k Theme
POWERLEVEL9K_INSTALLATION_PATH=~/.antigen/bundles/bhilburn/powerlevel9k
antigen theme bhilburn/powerlevel9k powerlevel9k
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs kubecontext)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
DEFAULT_USER=$(whoami)
# Tell antigen that you're done.
antigen apply

source <(kubectl completion zsh)

export EDITOR=vim
