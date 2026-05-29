use std log
use mise.nu
use nu.nu

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

    "
@complete external
def --wrapped bazel [ ...rest ] {
  ^bazelisk ...$rest
}

alias bzl = bazel
" | nu save_vendor_autoload bazel
}

export def bootstrap [] {
	install_buildifier
	install_bazelisk
}

def main [] {
    bootstrap
}
