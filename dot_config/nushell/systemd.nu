use std/log

export def write_user_service [ name: string, user_systemd_config: record ] {
    let userSystemDDir = [ $env.HOME, .config, systemd, user ] | path join
    mkdir $userSystemDDir
    let userSystemDPath = [ $userSystemDDir, $"($name).service" ] | path join

    let obj = {
        Unit: {
            Description: $name
            After: "network-online.target"
            Wants: "network-online.target"
        },
        Service: {
            Type: "simple"
            ExecStart: "/bin/true"
            Restart: "on-failure"
            RestartSec: 5
        },
        Install: {
            WantedBy: "default.target"
        }
    } | merge deep $user_systemd_config

    $obj | to ini | save -f $userSystemDPath
    log info $"wrote ($userSystemDPath)"

    log info "executing: systemctl --user daemon-reload"
    ^systemctl --user daemon-reload

    log info $"To enable and run on login: systemctl --user enable --now ($name).service"
}

def "to ini" [] {
    transpose section data | each { |row|
        $"[($row.section)]\n" + ($row.data | transpose k v | each { |kv| $"($kv.k)=($kv.v)" } | str join "\n")
    } | str join "\n\n"
}
