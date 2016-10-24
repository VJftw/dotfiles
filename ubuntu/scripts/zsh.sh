#!/bin/bash

echo ""
echo "Installing zsh antigen"
echo ""
sudo apt-get install -y zsh
git clone --depth 1 https://github.com/zsh-users/antigen.git ~/.antigen
# Download .zshrc
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.zshrc -o ~/.zshrc

echo ""
echo "Installing Fantasque Sans Mono and a Powerline patched font"
echo ""
mkdir -p ~/.fonts
curl -L https://gist.github.com/qrush/1595572/raw/6c453ddc959b93895ffbf4fd904e2ba60256c904/Menlo-Powerline.otf -o ~/.fonts/menlo-powerline.otf
curl -L -O https://github.com/belluzj/fantasque-sans/releases/download/v1.7.1/FantasqueSansMono.tar.gz
tar -xvzf FantasqueSansMono.tar.gz
mv *.ttf ~/.fonts/


echo ""
echo "Setting ZSH as shell"
echo ""
sudo chsh -s /usr/bin/zsh $(whoami)
