use std log

export def install_buildifier [ ] {
    mise use --global buildifier@latest
}

export def install_bazelisk [ ] {
    mise use --global bazelisk@latest

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
