use std log

def install_kubectl [] {
    let kubectlBinPath = [$env.HOME, .local, bin, kubectl] | path join

    let stableVersion = (http get https://dl.k8s.io/release/stable.txt)

    if ($kubectlBinPath | path exists) {
        let currentVersion = ^$kubectlBinPath version | complete | get stdout |
            lines | where $it =~ "Client Version" | split row ":" | last | str trim
        log info $"stable kubectl version: ($stableVersion) \(current: ($currentVersion)\)"

        if ($currentVersion == $stableVersion) {
            return
        }
    }

    http get $'https://dl.k8s.io/release/($stableVersion)/bin/linux/amd64/kubectl' |
        save --progress $kubectlBinPath
    ^chmod +x $kubectlBinPath
}

export def bootstrap [] {
    install_kubectl

	const vendor_autoload_path = path self ([vendor, autoload, kubectl.nu] | path join)
    cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, kubectl.nu] | path join)
}

def main [] {
    bootstrap
}
