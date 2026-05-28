use std log
use mise.nu

export def bootstrap [] {
    mise write_conf_d "helix" {
        tools: {
            "github:helix-editor/helix": "latest"
        },
        tool_alias: {
            hx: "github:helix-editor/helix"
        }
    }

	const vendor_autoload_path = path self ([vendor, autoload, hx.nu] | path join)
    cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, hx.nu] | path join)
}

def main [] {
    bootstrap
}
