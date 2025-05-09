#!/usr/bin/env sh
set -xue

binPath="$HOME/.local/bin"
thirdPartyPath="$binPath/third_party"

main() {
	setup_nushell

	"$binPath/nu" "$HOME/.config/nushell/bootstrap.nu"
}

setup_nushell() {
	version="0.104.0"

	arch="$(uname -m)"
	os=""
	
	case "$(uname -o)" in
	  GNU/Linux)
	    os="unknown-linux-gnu"
	  ;;
	  *)
	  echo "unsupported OS: $(uname -o)" 
	  exit 1
	  ;;
	esac

	releaseName="nu-$version-$arch-$os"

	curl -L -o "$releaseName.tar.gz" \
	    "https://github.com/nushell/nushell/releases/download/$version/$releaseName.tar.gz"

	extractDir="$thirdPartyPath/github.com/nushell/nushell"
	mkdir -p "$extractDir"
	tar -C "$extractDir" -xzf "$releaseName.tar.gz"
	rm -f "$binPath/nu" "$releaseName.tar.gz"
	ln -s "$extractDir/$releaseName/nu" "$binPath/nu" 
}

main "$@"

"$HOME/.local/bin/nu" \
	"$HOME/.config/nushell/bootstrap.nu"
