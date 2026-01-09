#!/usr/bin/env nu
use std log

export def ensure_local_gitconfig_property [property: string] {
    let existingValue = (^git config get -f ~/.local.gitconfig $property)
    if ($existingValue | is-empty) {
        log info $'Enter new value for ($property) in ~/.local.gitconfig:'
        let value = (input)
        ^git config set -f ~/.local.gitconfig $property $value
    } else {
        log info $'($property) already set in ~/.local.gitconfig as "($existingValue)"'
    }
}

export def bootstrap [] {
    ensure_local_gitconfig_property "user.name"
    ensure_local_gitconfig_property "user.email"
}

def main [] {
    bootstrap
}
