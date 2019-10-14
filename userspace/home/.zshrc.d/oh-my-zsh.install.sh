#!/bin/zsh -e

# Install plugins
git_addresses=(
    "https://github.com/zsh-users/zsh-syntax-highlighting.git"
    "https://github.com/zsh-users/zsh-autosuggestions.git"
    "https://github.com/chrissicool/zsh-256color.git"
)
for url in $git_addresses; do
    name=$(echo ${url//.git} | rev | cut -d'/' -f1 | rev)
    install_dir="${HOME}/.oh-my-zsh/custom/plugins/${name}"
    if [ ! -d "$install_dir" ]; then
        git clone --depth=1 "${url}" "${install_dir}"
    else
        cwd="${PWD}"
        cd "${install_dir}"
        git pull
        cd "${cwd}"
    fi
done

# Install Theme
if [ ! -d "${HOME}/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
else
    cwd="${PWD}"
    cd "${install_dir}"
    git pull
    cd "${cwd}"
fi
