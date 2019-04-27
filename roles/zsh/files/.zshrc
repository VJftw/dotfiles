if [ $TERMINIX_ID ] || [ $VTE_VERSION ]; then
     source /etc/profile.d/vte.sh
fi

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle git-flow
antigen bundle pip
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle rimraf/k

# Load the theme.
# antigen theme https://gist.github.com/3750104.git agnoster
POWERLEVEL9K_INSTALLATION_PATH=~/.antigen/bundles/bhilburn/powerlevel9k
antigen theme bhilburn/powerlevel9k powerlevel9k
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
DEFAULT_USER=$(whoami)


# Tell antigen that you're done.
antigen apply

export GOPATH="$HOME/Projects/gocode"
export PATH="$PATH:$GOPATH/bin:$HOME/.bin:$HOME/.local/bin"
export EDITOR=vim
