#!/usr/bin/env zsh

for f in $(ls $HOME/.zshrc.d/*.zsh | sort); do
    source "${f}";
done
