#!/bin/bash

cd /tmp

sudo uname -a

curl -L https://aur.archlinux.org/cgit/aur.git/snapshot/cower-git.tar.gz -o cower-git.tar.gz
tar -xvzf cower-git.tar.gz
cd cower-git
makepkg -si
cd ../
rm -rf cower-git cower-git.tar.gz

curl -L https://aur.archlinux.org/cgit/aur.git/snapshot/pacaur.tar.gz -o pacaur.tar.gz
tar -xvzf pacaur.tar.gz
cd pacaur
makepkg -si
cd ../
rm -rf pacaur pacaur.tar.gz
