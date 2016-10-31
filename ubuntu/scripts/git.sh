#!/bin/bash

echo ""
echo "Installing git"
echo ""
sudo apt-add-repository ppa:git-core/ppa -y
sudo apt-get update -y
sudo apt-get -f install git -y

git config --global core.editor "vim"
