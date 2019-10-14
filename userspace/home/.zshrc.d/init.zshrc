for f in $(ls ~/.vjftw.zshrc.d/*.zsh | sort); do
    source "${f}";
done
