use std log

export def bootstrap [ ] {
    let settings_path = match $nu.os-info.name {
        "linux" => ([$env.HOME, .config, zed, settings.json] | path join),
        "windows" => ([$env.APPDATA, Roaming, Zed, settings.json] | path join),
        "darwin" => ([$env.HOME, .zed, settings.json] | path join),
    }

    if not ($settings_path | path exists) {
        mkdir ($settings_path | path dirname)
        '{}' | save $settings_path
    }

    open $settings_path |
    upsert "disable_ai" true |
    upsert "git.inline_blame.show_commit_summary" true |
    upsert "terminal.toolbar.breadcrumbs" false |
    upsert "terminal.copy_on_select" true |
    upsert "terminal.cursor_shape" 'bar' |
    upsert "terminal.shell" 'bar' |
    upsert "buffer_line_height" 'comfortable' |
    upsert "buffer_font_weight" 400.0 |
    upsert "buffer_font_family" 'SauceCodePro NFM' |
    upsert "icon_theme.mode" 'system' |
    upsert "icon_theme.light" 'Catppuccin Frappé' |
    upsert "icon_theme.dark" 'Catppuccin Macchiato' |
    upsert "base_keymap" 'VSCode' |
    upsert "ui_font_size" 16 |
    upsert "buffer_font_size" 12.0 |
    upsert "theme.mode" 'system' |
    upsert "theme.light" 'Catppuccin Frappé' |
    upsert "theme.dark" 'Catppuccin Macchiato' |
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

def main [] {
    bootstrap
}
