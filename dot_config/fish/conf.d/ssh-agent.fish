#!/usr/bin/env fish
# Add ssh-keys to the ssh-agent

eval (ssh-agent -c)
set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
set -Ux SSH_AGENT_PID $SSH_AGENT_PID
set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK

set -l key_files (
    find "$HOME/.ssh" \
    -type f \
    -name "id*" \
    -and -not -name "*.pub"
  )


for key_file in $key_files
  if [ -f "$key_file" ]
    ssh-add "$key_file"
  end
end
