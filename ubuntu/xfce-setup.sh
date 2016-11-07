#!/bin/bash

cd /tmp/

# Update system
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/update-system.sh)

# Git
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/git.sh)

# Base
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/base.sh)

# ZSH
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/zsh.sh)

echo ""
echo "Creating Projects dir"
echo ""
mkdir -p ~/Projects

# Google Chrome
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/google-chrome.sh)

# Atom
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/atom.sh)

# GoDeb
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/godeb.sh)

# Docker
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/docker.sh)

# Invoke
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/invoke.sh)

# Slack
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/slack.sh)

# Insync
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/insync.sh)

# Steam
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/steam.sh)

# GTK
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/gtk-theme.sh)

# Synapse
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/synapse.sh)

# Plank
bash <(curl -s https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/scripts/plank.sh)

# Download XFCE4 configuration
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml -o ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml -o ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/xfce4/helpers.rc -o ~/.config/xfce4/xfconf/helpers.rc

echo ""
echo "Cleaning up"
echo ""
sudo rm -rf /tmp/*
