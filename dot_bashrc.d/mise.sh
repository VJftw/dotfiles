#!/usr/bin/env bash

# Export mise shims to Bash PATH.
miseShimsDir="$HOME/.local/share/mise/shims"
if [ -d "$miseShimsDir" ]; then
  export PATH="$miseShimsDir:$PATH"
fi
