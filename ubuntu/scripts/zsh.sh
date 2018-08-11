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

# Nerd Fonts
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/3270.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/AnonymousPro.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Arimo.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FantasqueSansMono.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FiraCode.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Mono.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Hack.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Hasklig.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/HeavyData.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Hermit.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Inconsolata.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Iosevka.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Lekton.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Meslo.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Monofur.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Monoid.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Mononoki.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/OpenDyslexic.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Overpass.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/ProFont.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/ProggyClean.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/SourceCodePro.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/SpaceMono.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Terminus.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Tinos.zip
mkdir -p ~/.local/share/fonts/NerdFonts
unzip -d ~/.local/share/fonts/NerdFonts *.zip
rm *.zip

echo ""
echo "Setting ZSH as shell"
echo ""
sudo chsh -s /usr/bin/zsh $(whoami)

zsh > /dev/null &
