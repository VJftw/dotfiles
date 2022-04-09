#!/bin/bash
set -euxo pipefail

curl -O https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz
tar -xvzf godeb-amd64.tar.gz
sudo mv godeb /usr/bin/
mkdir -p ~/go
