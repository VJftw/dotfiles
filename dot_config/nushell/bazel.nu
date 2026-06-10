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
            "github:bazelbuild/bazelisk" : {
                version: "latest",
                "bin" : "bazel"
            },
        },
    }

    "
@complete external
def --wrapped bazel [ ...rest ] {
  ^bazel ...$rest
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
