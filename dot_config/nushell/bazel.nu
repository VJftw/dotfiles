use std log
use mise.nu

export def install_buildifier [ ] {
    mise write_conf_d "buildifier" {
        tools: {
            "buildifier" : "latest"
        },
    }
}

export def install_bazelisk [ ] {
    mise write_conf_d "bazelisk" {
        tools: {
            "bazelisk" : "latest"
        },
    }

	const vendor_autoload_path = path self ([vendor, autoload, bazel.nu] | path join)
    cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, bazel.nu] | path join)
}

export def bootstrap [] {
	install_buildifier
	install_bazelisk
}

def main [] {
    bootstrap
}
