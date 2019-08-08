#!/bin/bash -e

apt-add-repository ppa:git-core/ppa -y
apt-get update -y
apt-get -f install git -y
