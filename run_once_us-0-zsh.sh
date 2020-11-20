#!/bin/bash
set -euo pipefail

plugins=(
    "zsh-syntax-highlighting|https://github.com/zsh-users/zsh-syntax-highlighting.git"
    "zsh-autosuggestions|https://github.com/zsh-users/zsh-autosuggestions.git"
    "zsh-256color|https://github.com/chrissicool/zsh-256color.git"
)

themes=(
    "powerlevel9k|https://github.com/bhilburn/powerlevel9k.git"
    "powerlevel10k|https://github.com/romkatv/powerlevel10k.git"
)

git clone --depth=1 \
    "https://github.com/robbyrussell/oh-my-zsh.git" \
    "${HOME}/.oh-my-zsh"

for plugin in "${plugins[@]}"; do
    name=$(echo "${plugin}" | cut -d\| -f1)
    repo=$(echo "${plugin}" | cut -d\| -f2)
    git clone --depth=1 \
        "${repo}" \
        "${HOME}/.oh-my-zsh/custom/plugins/${name}"
done

for theme in "${themes[@]}"; do
    name=$(echo "${theme}" | cut -d\| -f1)
    repo=$(echo "${theme}" | cut -d\| -f2)
    git clone --depth=1 \
        "${repo}" \
        "${HOME}/.oh-my-zsh/custom/themes/${name}"
done
