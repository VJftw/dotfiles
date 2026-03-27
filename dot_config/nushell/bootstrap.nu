use std log
use git.nu
use oh-my-posh.nu
use carapace.nu
use hx.nu

mkdir ([$nu.data-dir, vendor, autoload] | path join)

hx bootstrap

git bootstrap

oh-my-posh bootstrap
carapace bootstrap
