#!/bin/bash

echo ""
echo "Installing Google Chrome"
echo ""
curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install libappindicator1 chrome-gnome-shell -y
sudo dpkg -i google-chrome-stable_current_amd64.deb
