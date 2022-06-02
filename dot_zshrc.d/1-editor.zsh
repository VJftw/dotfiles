#!/usr/bin/env zsh

if command -v vim; then
    export EDITOR=vim
fi

if command -v nvim; then
    alias vim=nvim
    export EDITOR=nvim
fi

export GPG_TTY=$(tty)
