source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle git-flow
antigen bundle pip
antigen bundle command-not-found
antigen bundle gem

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle rimraf/k

# Load the theme.
antigen theme https://gist.github.com/3750104.git agnoster

# Tell antigen that you're done.
antigen apply

export GOPATH="$HOME/Projects/gocode"
export PATH="$PATH:$GOPATH/bin"

alias cp="rsync -avz --progress"
