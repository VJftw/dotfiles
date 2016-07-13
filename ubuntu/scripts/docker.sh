#!/bin/bash

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
