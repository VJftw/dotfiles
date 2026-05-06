export def shim_dir []: nothing -> string {
    match $nu.os-info.name {
        "linux" => ([$env.HOME, .local, share, mise, shims] | path join),
        "darwin" => ([$env.HOME, .local, share, mise, shims] | path join),
        "windows" => ([$env.LOCALAPPDATA, mise, shims] | path join),
    }
}
