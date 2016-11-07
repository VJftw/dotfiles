#!/bin/bash

echo ""
echo "Installing Adapta and Paper GTK 3 theme parts"
echo ""
sudo apt-add-repository ppa:tista/adapta -y
sudo add-apt-repository ppa:snwh/pulp -y
sudo add-apt-repository ppa:numix/ppa -y
# Arc theme
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"
wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
sudo apt-key add - < Release.key

sudo apt-get update
sudo apt install arc-theme numix-icon-theme-circle numix-gtk-theme adapta-gtk-theme paper-icon-theme paper-cursor-theme -y
# Making globally dark
# mkdir -p ~/.config/gtk-3.0/
# curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/gtk-3.0/settings.ini -o ~/.config/gtk-3.0/settings.ini
