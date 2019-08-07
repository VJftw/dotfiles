#!/bin/bash

echo ""
echo "Installing Variety"
echo ""
sudo apt-add-repository ppa:peterlevi/ppa -y
sudo apt-get update -y
sudo apt-get install variety -y
mkdir -p ~/.config/variety
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/variety/variety.conf -o ~/.config/variety/variety.conf

echo "Starting Variety..."
variety > /dev/null &
