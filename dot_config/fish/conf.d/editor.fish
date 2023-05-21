#!/usr/bin/env fish
# Sets the default editor

if command -v vim &> /dev/null
  set --export EDITOR vim
end                

if command -v nvim &> /dev/null
  alias vim=nvim
  set --export EDITOR nvim
end

set --export GPG_TTY "$(tty)"

