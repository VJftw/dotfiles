use std log
use hx.nu
use git.nu
use carapace.nu
use oh-my-posh.nu

mkdir ([$nu.data-dir, vendor, autoload] | path join)

source ([$nu.data-dir, vendor, autoload, mise.nu] | path join)

hx bootstrap
git bootstrap
carapace bootstrap
oh-my-posh bootstrap
