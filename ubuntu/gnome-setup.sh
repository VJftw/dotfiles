#!/bin/bash

cd /tmp/

# Update system
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/update-system.sh)

# Base
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/base.sh)

# Tilix
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/tilix.sh)

# GTK Theme
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/gtk-theme.sh)
echo ""
echo "Setting United Gnome and Paper GTK 3 theme parts"
echo ""
gsettings set org.gnome.desktop.interface gtk-theme "United-Ubuntu-Dark-Compact"
gsettings set org.gnome.desktop.wm.preferences theme "United-Ubuntu-Dark-Compact"
gsettings set org.gnome.desktop.interface icon-theme "Paper"
gsettings set org.gnome.desktop.interface cursor-theme "Paper"

# Git
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/git.sh)

# Docker
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/docker.sh)

# ZSH
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/zsh.sh)

# Google Chrome
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/google-chrome.sh)

# VSCode
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/vscode.sh)

# GoDeb
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/godeb.sh)

# Slack
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/slack.sh)

# Gnome Tweak Tool
sudo apt-get -f install -y gnome-tweak-tool

echo ""
echo "Creating Projects dir"
echo ""
mkdir -p ~/Projects

echo ""
echo "Cleaning up"
echo ""
sudo rm -rf /tmp/*
