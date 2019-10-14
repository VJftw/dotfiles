#!/bin/bash -e

# Install oh-my-zsh
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# Install/update .zshrc.d
if [ ! -d "${HOME}/.vjftw.dotfiles" ]; then
    git clone https://github.com/vjftw/dotfiles ~/.vjftw.dotfiles
else
    cwd="${PWD}"
    cd "${HOME}/.vjftw.dotfiles"
    git pull
    cd "${cwd}"
fi

ln -s ~/.vjftw.dotfiles/userspace/home/.zshrc.d ~/.zshrc.d || true

# source it in zshrc
touch ~/.zshrc || true
grep "source ~/.zshrc.d/init.zshrc" ~/.zshrc || echo "source ~/.zshrc.d/init.zshrc" >> ~/.zshrc

~/.zshrc.d/oh-my-zsh.install.sh
