#!/usr/bin/env zsh

eval $(ssh-agent -s)

key_files=(
  "$HOME/.ssh/id_ed25519"
)

for key_file in "${key_files[@]}"; do
  if [ -f "$key_file" ]; then
    ssh-add "$key_file"
  fi
done
