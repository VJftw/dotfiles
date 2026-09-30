use std/log
use mise.nu
use systemd.nu

export def bootstrap [ ] {
    mise write_conf_d "claude" {
        tools: {
            "claude" : "latest"
        }
    }

    let claudeBin = [(mise shim_dir), claude] | path join

    systemd write_user_service "claude" {
        Unit: {
            Description: "Claude Remote"
        }
        Service: {
            Restart: "always"
            ExecStart: $"($claudeBin) rc"
        }
    }
}

def main [] {
    bootstrap
}
