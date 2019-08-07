#!/bin/bash

echo ""
echo "Installing Docker"
echo ""

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   zesty \
   stable"

sudo apt-get update -y
sudo apt-get install docker-ce -y

sudo usermod -aG docker $(whoami)
sudo systemctl enable docker

sudo systemctl stop docker
sudo /bin/bash -c 'cat > /etc/docker/daemon.json' << EOF
{
  "storage-driver": "overlay2"
}
EOF
sudo systemctl start docker
