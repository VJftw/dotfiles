#!/bin/bash

sudo pacman -S --noconfirm docker

sudo gpasswd -a ${USER} docker

sudo mkdir -p /etc/systemd/system/docker.service.d/
sudo /bin/bash -c 'cat > /etc/systemd/system/docker.service.d/override.conf' << EOF
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -s overlay2
EOF

sudo systemctl restart docker
