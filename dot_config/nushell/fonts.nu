use std log
use mise.nu

export def bootstrap [ ] {
    mise write_conf_d "font_lilex" {
        tools: {
            "github:mishamyrt/Lilex": "latest"
        }
    }

    let fontPath = [(mise installs_dir),
        github-mishamyrt-lilex, latest, ttf, Lilex-Regular.ttf
    ] | path join

    let userFontDir = user_font_dir
    mkdir $userFontDir
    log info $"copying '($fontPath)' to '($userFontDir)'"
    cp $fontPath $userFontDir

    match $nu.os-info.name {
        "linux" => (^fc-cache -fv)
    }
}

def user_font_dir []: nothing -> string {
    match $nu.os-info.name {
        "linux" => ([$env.HOME, .local, share, fonts] | path join),
        "darwin" => ([$env.HOME, Library, fonts] | path join),
        "windows" => ([$env.LOCALAPPDATA, Microsoft, Windows, Fonts] | path join)
    }
}

def main [] {
    bootstrap
}
