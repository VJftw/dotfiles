use std log
use git.nu
use oh-my-posh.nu
use carapace.nu
use hx.nu
use vfox.nu

mkdir ([$nu.data-dir, vendor, autoload] | path join)

vfox bootstrap

hx bootstrap

git bootstrap

oh-my-posh bootstrap
carapace bootstrap
