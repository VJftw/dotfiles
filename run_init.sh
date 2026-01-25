#!/usr/bin/env bash
set -Eeuo pipefail

binPath="$HOME/.local/bin"
thirdPartyPath="$binPath/third_party"

export PATH="$PATH:$binPath"

log() {
	>&2 printf '%s\n' "$@"
}

main() {
	# setup_nushell
	# "$binPath/nu" "$HOME/.config/nushell/bootstrap.nu"

  setup_bash
}

setup_bash() {
  # ensure block in bashrc
  if ! grep ".bashrc.d/" "$HOME/.bashrc"; then
    cat <<'EOF' >> "$HOME/.bashrc"

for file in ~/.bashrc.d/*.bashrc; do
  source "$file"
done
EOF
  fi
}

setup_nushell() {
  extraCurlFlags=()
  if [ -n "${GITHUB_TOKEN:-}" ]; then
    extraCurlFlags+=("--header" "Authorization: Bearer $GITHUB_TOKEN")
  fi
	version="$(curl -s "${curlFlags[@]}" https://api.github.com/repos/nushell/nushell/releases/latest | grep "tag_name" | cut -f4 -d\")"

	currentVersion=""
	if [ -f "$binPath/nu" ]; then
		currentVersion="$("$binPath/nu" --version)"
	fi

	log "latest nushell version: $version (current: $currentVersion)"
	if [[ "$currentVersion" == "$version" ]]; then
		return
	fi

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
