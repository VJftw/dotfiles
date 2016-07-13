#!/bin/bash

echo ""
echo "Installing Adapta and Paper GTK 3 theme parts"
echo ""
sudo apt-add-repository ppa:tista/adapta -y
sudo add-apt-repository ppa:snwh/pulp -y
sudo apt-get update
sudo apt install adapta-gtk-theme paper-icon-theme paper-cursor-theme -y
# Making globally dark
mkdir -p ~/.config/gtk-3.0/
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/gtk-3.0/settings.ini -o ~/.config/gtk-3.0/settings.ini

echo ""
echo "Setting Adapta and Paper GTK 3 theme parts"
echo ""
gsettings set org.gnome.desktop.interface gtk-theme "Adapta"
gsettings set org.gnome.desktop.wm.preferences theme "Adapta"
gsettings set org.gnome.desktop.interface icon-theme "Paper"
gsettings set org.gnome.desktop.interface cursor-theme "Paper"
