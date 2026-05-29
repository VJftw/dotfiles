use std log
use mise.nu
use nu.nu

export def bootstrap [] {
    mise write_conf_d "helix" {
        tools: {
            "github:helix-editor/helix": "latest"
        },
        tool_alias: {
            hx: "github:helix-editor/helix"
        }
    }

    let hxBin = [(mise shim_dir), hx] | path join

    $"$env.config.buffer_editor = \"($hxBin)\"" | nu save_vendor_autoload hx
}

def main [] {
    bootstrap
}
