#!/bin/bash

echo ""
echo "Installing git"
echo ""
sudo apt-add-repository ppa:git-core/ppa -y
sudo apt-get update -y
sudo apt-get install git -y
