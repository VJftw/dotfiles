#!/bin/bash

echo ""
echo "Installing curl, htop, terminator"
echo ""
sudo apt-get install curl htop terminator apt-transport-https ca-certificates -y
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'
