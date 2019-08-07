#!/bin/bash

echo ""
echo "Installing curl, htop, vim"
echo ""
sudo apt-get -f install vim curl htop apt-transport-https ca-certificates -y
