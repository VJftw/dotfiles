#!/bin/bash -e

# Install oh-my-zsh
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Download .vjftw.zshrc
curl -L https://raw.githubusercontent.com/VJftw/dotfiles/master/userspace/home/.vjftw.zshrc -o ~/.vjftw.zshrc

# source it in zshrc
grep "source ~/.vjftw.zshrc" ~/.zshrc || echo "source ~/.vjftw.zshrc" >> ~/.zshrc
