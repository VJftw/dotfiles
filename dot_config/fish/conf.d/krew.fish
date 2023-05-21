#!/usr/bin/env fish
# Include kubectl krew plugins

set krew_root "$HOME/.krew"

if set -q KREW_ROOT; and test -n KREW_ROOT
  set krew_root "$KREW_ROOT"
end

set --export PATH "$KREW_ROOT/bin" "$PATH"

