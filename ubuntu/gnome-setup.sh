#!/bin/bash

cd ~/Downloads

echo ""
echo "Updating System..."
echo ""
sudo apt-get update -y
sudo apt-get dist-upgrade -y

echo ""
echo "Installing curl, htop, zsh, terminator, gnome-tweak-tool"
echo ""
sudo apt-get install curl htop zsh terminator apt-transport-https ca-certificates gnome-tweak-tool -y
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'

echo ""
echo "Installing Variety"
echo ""
sudo apt-add-repository ppa:peterlevi/ppa -y
sudo apt-get update -y
sudo apt-get install variety -y
mkdir -p ~/.config/variety
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.config/variety/variety.conf -o ~/.config/variety/variety.conf

echo "Starting Variety..."
variety &

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
gsettings set com.canonical.Unity.Launcher launcher-position Bottom

echo ""
echo "Installing git"
echo ""
sudo apt-add-repository ppa:git-core/ppa -y
sudo apt-get update -y
sudo apt-get install git -y

echo ""
echo "Installing zsh antigen"
echo ""
git clone --depth 1 https://github.com/zsh-users/antigen.git ~/.antigen
# Download .zshrc
curl -L https://raw.githubusercontent.com/VJftw/workspace-settings/master/ubuntu/.zshrc -o ~/.zshrc

echo ""
echo "Installing Fantasque Sans Mono and a Powerline patched font"
echo ""
mkdir -p ~/.fonts
curl -L https://gist.github.com/qrush/1595572/raw/6c453ddc959b93895ffbf4fd904e2ba60256c904/Menlo-Powerline.otf -o ~/.fonts/menlo-powerline.otf
curl -L -O https://github.com/belluzj/fantasque-sans/releases/download/v1.7.1/FantasqueSansMono.tar.gz
tar -xvzf FantasqueSansMono.tar.gz
mv *.ttf ~/.fonts/

echo ""
echo "Creating Projects dir"
echo ""
mkdir -p ~/Projects

echo ""
echo "Installing Google Chrome"
echo ""
curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install libappindicator1 -y
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo ""
echo "Installing Atom"
echo ""
curl -L https://atom.io/download/deb -o atom-amd64.deb
sudo dpkg -i atom-amd64.deb
apm install sync-settings

echo ""
echo "Installing rvm and nvm"
echo ""
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# Install godeb
echo ""
echo "Installing godeb"
echo ""
curl -O https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz
tar -xvzf godeb-amd64.tar.gz
sudo mv godeb /usr/bin/
godeb install 1.6.2
mkdir -p ~/Projects/gocode

echo ""
echo "Installing Docker"
echo ""
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' | sudo tee --append /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) -y
sudo apt-get install docker-engine -y

sudo groupadd docker
sudo usermod -aG docker $(whoami)
sudo systemctl enable docker

echo ""
echo "Installing Pip, Invoke and invoke-docker-flow"
echo ""
sudo apt-get install python3-dev python3
curl -O -L https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
sudo pip install invoke-docker-flow

echo ""
echo "Cleaning up"
echo ""
rm -rf ~/Downloads/*
