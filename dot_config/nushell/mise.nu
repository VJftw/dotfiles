export def shim_dir []: nothing -> string {
    match $nu.os-info.name {
        "linux" => ([$env.HOME, .local, share, mise, shims] | path join),
        "darwin" => ([$env.HOME, .local, share, mise, shims] | path join),
        "windows" => ([$env.LOCALAPPDATA, mise, shims] | path join),
    }
}

export def write_conf_d [ name: string, obj: record ] {
    let userConfDDir = [ $env.HOME, .config, mise, conf.d ] | path join
    mkdir $userConfDDir

    let userConfDPath = [ $userConfDDir, $"($name).toml" ] | path join

    $obj | to toml | save -f $userConfDPath

    log info $"wrote ($userConfDPath)"
    ^mise upgrade $name
}

export def exec [tool: string, args: list] {
    ^mise exec $tool -- ...$args
}
