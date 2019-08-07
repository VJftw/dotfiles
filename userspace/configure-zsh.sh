#!/bin/bash -e
git clone --depth 1 https://github.com/zsh-users/antigen.git ~/.antigen

# Download .vjftw.zshrc
curl -L https://raw.githubusercontent.com/VJftw/dotfiles/master/userspace/home/.vjftw.zshrc -o ~/.vjftw.zshrc

# source it in zshrc
grep "source ~/.vjftw.zshrc" ~/.zshrc || echo "source ~/.vjftw.zshrc" >> ~/.zshrc

