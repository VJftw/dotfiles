#!/bin/bash

echo ""
echo "Installing Pip, Invoke and invoke-docker-flow"
echo ""
sudo apt-get install python3-dev python3
curl -O -L https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
sudo pip install invoke-docker-flow
