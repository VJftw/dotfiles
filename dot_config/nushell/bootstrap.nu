#!/usr/bin/env nu
use std log
use git.nu
use oh-my-posh.nu
use carapace.nu

# Ensure minimum ~/.local.gitconfig
git bootstrap

oh-my-posh bootstrap
carapace bootstrap
