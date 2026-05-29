use std log

export def save_vendor_autoload [ name: string ] {
    let autoloadDir = [$nu.data-dir, vendor, autoload] | path join
    mkdir $autoloadDir

    let autoloadPath = [$autoloadDir $"($name).nu" ] | path join

    $in | save -f $autoloadPath

    log info $"wrote ($autoloadPath)"
}
