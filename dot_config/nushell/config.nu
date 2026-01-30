use std/util "path add"

path add ([$env.HOME, .local, bin] | path join)

alias ll = ls -l
