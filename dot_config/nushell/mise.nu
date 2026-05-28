export def shim_dir []: nothing -> string {
    match $nu.os-info.name {
        "linux" => ([$env.HOME, .local, share, mise, shims] | path join),
        "darwin" => ([$env.HOME, .local, share, mise, shims] | path join),
        "windows" => ([$env.LOCALAPPDATA, mise, shims] | path join),
    }
}

export def write_conf_d [ name: string, obj: record ] {
    let user_conf_d = [ $env.HOME, .config, mise, conf.d ] | path join
    mkdir $user_conf_d

    $obj | to toml | save -f ([ $user_conf_d, $"($name).toml" ] | path join)
}
