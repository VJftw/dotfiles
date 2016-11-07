#!/bin/bash
echo ""
echo "Installing Synapse"
echo ""

sudo apt-get update -y
sudo apt-get install -y synapse

mkdir -p ~/.config/autostart
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/autostart/synapse.desktop -o ~/.config/autostart/synapse.desktop

/usr/bin/synapse > /dev/null &
