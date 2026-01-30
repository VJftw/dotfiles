use std log

export def bootstrap [ ] {
    for settings_path in (settings_paths) {
        if not ($settings_path | path exists) {
            mkdir ($settings_path | path dirname)
            '{}' | save $settings_path
        }

        open $settings_path |
        upsert "editor.codeLens" true |
        upsert "editor.fontLigatures" true |
        upsert "editor.formatOnSave" true |
        upsert "editor.rulers" [80, 120] |
        upsert "files.insertFinalNewline" true |
        upsert "files.trimFinalNewlines" true |
        upsert "files.trimTrailingWhitespace" true |
        upsert "gitlens.rebaseEditor.openOnPausedRebase" false |
        upsert "terminal.integrated.cursorBlinking" true |
        upsert "terminal.integrated.cursorStyle" "line" |
        upsert "terminal.integrated.defaultProfile.linux" "nushell (login)" |
        upsert "terminal.integrated.fontFamily" "'SauceCodePro Nerd Font Mono', SauceCodePro, 'SauceCodePro Nerd Font', 'SauceCodePro NF', Consolas, 'Courier New', monospace" |
        upsert "terminal.integrated.fontLigatures.enabled" true |
        upsert "terminal.integrated.localEchoLatencyThreshold" (-1) |
        upsert "terminal.integrated.profiles.linux"."nushell (login)" {'path': $nu.current-exe,'args': ['--login']} |
        upsert "terminal.integrated.shellIntegration.decorationsEnabled" "never" |
        upsert "terminal.integrated.shellIntegration.enabled" false |
        upsert "terminal.integrated.shellIntegration.history" 0 |
        upsert "terminal.integrated.shellIntegration.quickFixEnabled" false |
        upsert "terminal.integrated.shellIntegration.showCommandGuide" false |
        upsert "workbench.secondarySideBar.defaultVisibility" "hidden" |
        save --force $settings_path

        log info $'updated ($settings_path)'
    }

}

def settings_paths [ ]: nothing -> list {
    if $nu.os-info.name == "linux" {
        return [
            ([$env.HOME, .vscode-server, data, Machine, settings.json] | path join) # Linux Server
            ([$env.HOME, .config, Code, User, settings.json] | path join) # Linux
        ]
    }

    if $nu.os-info.name == "windows" {
        return [
            ([$env.APPDATA, Code, User, settings.json] | path join) # Windows
        ]
    }

    if $nu.os-info.name == "darwin" {
        return [
            ([$env.HOME, Library, "Application Support", Code, User, settings.json] | path join) # Mac
        ]
    }
}

def main [] {
    bootstrap
}
