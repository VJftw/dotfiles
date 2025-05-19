#!/usr/bin/env bash
set -Eeuo pipefail

binPath="$HOME/.local/bin"
thirdPartyPath="$binPath/third_party"

export PATH="$PATH:$binPath"

main() {
	setup_nushell

	"$binPath/nu" "$HOME/.config/nushell/bootstrap.nu"
}

setup_nushell() {
  extraCurlFlags=()
  if [ -n "${GITHUB_TOKEN:-}" ]; then
    extraCurlFlags+=("--header" "Authorization: Bearer $GITHUB_TOKEN")
  fi
	version="$(curl -s "${curlFlags[@]}" https://api.github.com/repos/nushell/nushell/releases/latest | grep "tag_name" | cut -f4 -d\")"

	arch="$(uname -m)"
	os=""

	case "$(uname -o)" in
	  GNU/Linux)
	    os="unknown-linux-gnu"
	  ;;
    Darwin)
      os="apple-darwin"
    ;;
	  *)
      echo "unsupported OS: $(uname -o)"
      exit 1
	  ;;
	esac

	releaseName="nu-$version-$arch-$os"
  set -x
	curl -L -o "$releaseName.tar.gz" \
	    "https://github.com/nushell/nushell/releases/download/$version/$releaseName.tar.gz"
  set +x
	extractDir="$thirdPartyPath/github.com/nushell/nushell/$version"
	mkdir -p "$extractDir"
	tar -C "$extractDir" -xzf "$releaseName.tar.gz"
	rm -f "$binPath/nu" "$releaseName.tar.gz"
	ln -s "$extractDir/$releaseName/nu" "$binPath/nu"
}

main "$@"
