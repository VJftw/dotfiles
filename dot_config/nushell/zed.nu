use std log

export def bootstrap [ ] {
    let settings_paths = match $nu.os-info.name {
        "linux" => [([$env.HOME, .config, zed, settings.json] | path join), /home/vjftw/.var/app/dev.zed.Zed/config/zed/settings.json],
        "windows" => [([$env.APPDATA, Roaming, Zed, settings.json] | path join)],
        "darwin" => [([$env.HOME, .zed, settings.json] | path join)],
    }

    for settings_path in $settings_paths {
        if not ($settings_path | path exists) {
            mkdir ($settings_path | path dirname)
            '{}' | save $settings_path
        }

        open $settings_path |
        upsert "title_bar" {
            "show_sign_in": false,
        } |
        upsert "disable_ai" true |
        upsert "git" {
            "inline_blame": {
                "show_commit_summary": true,
            }
        } |
        upsert "terminal" {
            "copy_on_select": true,
            "cursor_shape": 'bar',
            "shell": 'system',
            "toolbar": {
                "breadcrumbs": false,
            }
       } |
        upsert "buffer_line_height" 'comfortable' |
        upsert "buffer_font_weight" 400.0 |
        upsert "buffer_font_family" 'SauceCodePro NFM' |
        upsert "icon_theme" {
            "mode": 'system',
            "light": 'Catppuccin Frappé',
            "dark": 'Catppuccin Macchiato',
        } |
        upsert "base_keymap" 'VSCode' |
        upsert "ui_font_size" 16 |
        upsert "buffer_font_size" 12.0 |
        upsert "theme" {
            "mode": 'system',
            "light": 'Catppuccin Frappé',
            "dark": 'Catppuccin Macchiato',
        } |
        upsert "auto_install_extensions" {
            'html': true,
            'dockerfile': true,
            'toml': true,
            'catppuccin': true,
            'catppuccin-icons': true,
            'terraform': true,
            'proto': true,
            'starlark': true,
            'nu': true,
        } |
        save --force $settings_path

        log info $'updated ($settings_path)'
    }

    try {
        ^flatpak --version | complete | ignore
        const vendor_autoload_path = path self ([vendor, autoload, flatpak-zed.nu] | path join)
        cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, flatpak-zed.nu] | path join)
    } catch {
        log info 'skipping flatpak alias'
    }
}

def main [] {
    bootstrap
}
