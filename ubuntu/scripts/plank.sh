#!/bin/bash
echo ""
echo "Installing Plank"
echo ""

sudo add-apt-repository -y ppa:docky-core/stable
sudo apt-get update -y
sudo apt-get install plank

mkdir -p ~/.config/autostart
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/autostart/Plank.desktop -o ~/.config/autostart/Plank.desktop

curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/plank/dock1/launchers/atom.dockitem -o ~/.config/plank/dock1/launchers/atom.dockitem
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/plank/dock1/launchers/clock.dockitem -o ~/.config/plank/dock1/launchers/clock.dockitem
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/plank/dock1/launchers/google-chrome.dockitem -o ~/.config/plank/dock1/launchers/google-chrome.dockitem
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/plank/dock1/launchers/jetbrains-idea.dockitem -o ~/.config/plank/dock1/launchers/jetbrains-idea.dockitem
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/plank/dock1/launchers/steam.dockitem -o ~/.config/plank/dock1/launchers/steam.dockitem
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/plank/dock1/launchers/terminator.dockitem -o ~/.config/plank/dock1/launchers/terminator.dockitem
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/plank/dock1/launchers/Thunar.dockitem -o ~/.config/plank/dock1/launchers/Thunar.dockitem
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/plank/dock1/launchers/xfcalendar.dockitem -o ~/.config/plank/dock1/launchers/xfcalendar.dockitem

/usr/bin/plank > /dev/null &
