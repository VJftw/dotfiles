#!/bin/bash
echo ""
echo "Installing Insync"
echo ""

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
echo 'deb http://apt.insynchq.com/ubuntu xenial non-free contrib' | sudo tee --append /etc/apt/sources.list.d/insync.list
sudo apt-get update -y
sudo apt-get install -y insync
