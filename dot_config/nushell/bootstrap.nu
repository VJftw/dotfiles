use std/log
use hx.nu
use git.nu
use carapace.nu
use starship.nu

mkdir ([$nu.data-dir, vendor, autoload] | path join)

source ([$nu.data-dir, vendor, autoload, mise.nu] | path join)

hx bootstrap
git bootstrap
carapace bootstrap
starship bootstrap

log info "Upgrading tools..."
mise upgrade --yes --bump
log info "Pruning old tools..."
mise prune --yes
