#!/bin/bash

echo ""
echo "Installing tilix"
echo ""
sudo add-apt-repository -y ppa:webupd8team/terminix
sudo apt-get update -y
sudo apt-get -f install -y tilix
gsettings set org.gnome.desktop.default-applications.terminal exec 'tilix'
