#!/bin/bash

echo ""
echo "Installing rvm and nvm"
echo ""
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
