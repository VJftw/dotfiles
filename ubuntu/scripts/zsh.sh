#!/bin/bash

echo ""
echo "Installing zsh antigen"
echo ""
sudo apt-get install -y zsh
git clone --depth 1 https://github.com/zsh-users/antigen.git ~/.antigen
# Download .zshrc
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.zshrc -o ~/.zshrc

echo ""
echo "Installing Nerd Fonts and Awesome Terminal Fonts"
echo ""
mkdir -p ~/.fonts
curl -L https://gist.github.com/qrush/1595572/raw/6c453ddc959b93895ffbf4fd904e2ba60256c904/Menlo-Powerline.otf -o ~/.fonts/menlo-powerline.otf

curl -L https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/devicons-regular.ttf -o ~/.fonts/devicons-regular.ttf
curl -L https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/fontawesome-regular.ttf -o ~/.fonts/fontawesome-regular.ttf
curl -L https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/octicons-regular.ttf -o ~/.fonts/octicons-regular.ttf
curl -L https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/build/pomicons-regular.ttf -o ~/.fonts/pomicons-regular.ttf

git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh


echo ""
echo "Setting ZSH as shell"
echo ""
sudo chsh -s /usr/bin/zsh $(whoami)

zsh > /dev/null &
