#!/bin/bash

echo ""
echo "Installing Xanmod Kernel"
echo ""
sudo apt-get install -y curl xz-utils

curl -L https://sourceforge.net/projects/xanmod/files/latest/download -o xanmod.tar.xz

tar -xJf xanmod.tar.xz

sudo dpkg -i *-xanmod*/*.deb

sudo apt-get autoremove -y > /dev/null
