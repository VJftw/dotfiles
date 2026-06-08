use std log
use mise.nu

export def bootstrap [ ] {
    mise write_conf_d "vscode" {
        tools: {
            "http:vscode": {
                version: "latest",
                url: "https://update.code.visualstudio.com/{{ version }}/linux-x64/stable",
                format: "tar.gz",
                version_list_url: "https://api.github.com/repos/microsoft/vscode/releases?per_page=1",
                version_json_path: ".[].tag_name",
            },
        },
        tool_alias: {
            vscode: "http:vscode"
        }
    }

    let shim_dir = mise shim_dir
    for settings_path in (settings_paths) {
        if not ($settings_path | path exists) {
            mkdir ($settings_path | path dirname)
            '{}' | save $settings_path
        }

        open $settings_path |
        upsert "chat.titleBar.signIn.enabled" false |
        upsert "editor.codeLens" true |
        upsert "editor.fontLigatures" true |
        upsert "editor.fontFamily" "Lilex, 'Symbols Nerd Font Mono', 'Droid Sans Mono', monospace" |
        upsert "editor.formatOnSave" true |
        upsert "editor.rulers" [80, 120] |
        upsert "files.insertFinalNewline" true |
        upsert "files.trimFinalNewlines" true |
        upsert "files.trimTrailingWhitespace" true |
        upsert "terminal.integrated.cursorBlinking" true |
        upsert "terminal.integrated.cursorStyle" "line" |
        upsert "terminal.integrated.defaultProfile.linux" "nushell (login)" |
        upsert "terminal.integrated.fontFamily" "Lilex, 'Symbols Nerd Font Mono', Consolas, 'Courier New', monospace" |
        upsert "terminal.integrated.fontLigatures.enabled" true |
        upsert "terminal.integrated.localEchoLatencyThreshold" (-1) |
        upsert "terminal.integrated.profiles.linux"."nushell (login)" {'path': ([$shim_dir, nu] | path join),'args': ['--login']} |
        upsert "terminal.integrated.shellIntegration.decorationsEnabled" "never" |
        upsert "terminal.integrated.shellIntegration.enabled" false |
        upsert "terminal.integrated.shellIntegration.history" 0 |
        upsert "terminal.integrated.shellIntegration.quickFixEnabled" false |
        upsert "terminal.integrated.shellIntegration.showCommandGuide" false |
        upsert "window.autoDetectColorScheme" true |
        upsert "workbench.iconTheme" "vscode-icons" |
        upsert "workbench.secondarySideBar.defaultVisibility" "hidden" |
        upsert "mermaidChart.showGenerateDiagramCodeLens" false |
        save --force $settings_path

        log info $'updated ($settings_path)'
    }

    install_extensions [
        "thenuprojectcontributors.vscode-nushell-lang",
        "mk12.better-git-line-blame",
        "ms-vscode.remote-explorer",
        "ms-vscode-remote.remote-ssh",
        "ms-azuretools.vscode-docker",
        "redhat.vscode-yaml",
        "vscode-icons-team.vscode-icons",
        "golang.go",
        "editorconfig.editorconfig",
        "hashicorp.terraform",
        "bazelbuild.vscode-bazel",
        "bufbuild.vscode-buf",
        "jebbs.plantuml",
        "MermaidChart.vscode-mermaid-chart",
    ]

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

def install_extensions [ extensions : list ] {
    let shim_dir = mise shim_dir
    let codeBin = ([ $shim_dir, code ] | path join)

    for extension in $extensions {
        mise exec "http:vscode" [code, --install-extension, $extension]
    }
}

def main [] {
    bootstrap
}
