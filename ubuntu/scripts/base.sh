#!/bin/bash

echo ""
echo "Installing curl, htop, terminator, vim"
echo ""
sudo apt-get -f install vim curl htop terminator apt-transport-https ca-certificates -y
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'
