#!/bin/bash

echo ""
echo "Installing United Gnome and Paper GTK 3 theme parts"
echo ""
sudo add-apt-repository ppa:snwh/pulp -y

sudo apt-get update
sudo apt install paper-icon-theme paper-cursor-theme -y

mkdir -p ~/.themes
curl -L -O https://dl.opendesktop.org/api/files/download/id/1501276805/United-Latest-Compact.tar.gz
tar -xvzf United-Latest-Compact.tar.gz --directory ~/.themes
