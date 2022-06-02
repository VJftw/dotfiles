#!/usr/bin/env zsh

if command -v vim &> /dev/null; then
    export EDITOR=vim
fi

if command -v nvim &> /dev/null; then
    alias vim=nvim
    export EDITOR=nvim
fi

export GPG_TTY=$(tty)
