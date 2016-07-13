#!/bin/bash

echo ""
echo "Installing godeb"
echo ""
curl -O https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz
tar -xvzf godeb-amd64.tar.gz
sudo mv godeb /usr/bin/
godeb install 1.6.2
mkdir -p ~/Projects/gocode
