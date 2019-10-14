#!/bin/bash -e

curl -L https://raw.githubusercontent.com/VJftw/dotfiles/master/userspace/tilix.dconf -o ~/.tilix.dconf
dconf load /com/gexperts/Tilix/ < ~/.tilix.dconf
rm ~/.tilix.dconf

gsettings set org.gnome.desktop.default-applications.terminal exec 'tilix'

# Download .tilix.zshrc
curl -L https://raw.githubusercontent.com/VJftw/dotfiles/master/userspace/home/.tilix.zshrc -o ~/.tilix.zshrc

# source it in zshrc
grep "source ~/.tilix.zshrc" ~/.zshrc || sed -i '1s#^#source ~/.tilix.zshrc\n#' ~/.zshrc
