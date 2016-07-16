#!/bin/bash

echo ""
echo "Installing Liqourix Kernel"
echo ""

echo 'deb http://mirror.unit193.net/liquorix sid main' | sudo tee --append /etc/apt/sources.list.d/liquorix.list
sudo apt-get update -y
sudo apt-get install -y liquorix-keyring
sudo apt-get update -y
sudo apt-get install -y linux-image-liquorix-amd64 linux-headers-liquorix-amd64

sudo apt-get autoremove -y
