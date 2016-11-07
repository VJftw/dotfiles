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

echo ""
echo "Cleaning up"
echo ""
sudo rm -rf /tmp/*
