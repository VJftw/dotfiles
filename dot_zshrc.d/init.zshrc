for f in $(ls ~/.zshrc.d/*.zsh | sort); do
    source "${f}";
done
