use std log

def local_git_config [] {
    return ([$env.HOME, .local.gitconfig] | path join)
}

export def ensure_local_gitconfig_property [property: string] {
    let localGitConfig = local_git_config
    let existingValue = (^git config get -f ($localGitConfig) $property | complete | get stdout | str trim)
    if ($existingValue | is-empty) {
        log info $'Enter new value for ($property) in ($localGitConfig):'
        let value = (input)
        ^git config set -f $localGitConfig $property $value
    } else {
        log info $'($property) already set in ($localGitConfig) as "($existingValue)"'
    }
}

export def setup_git_oauth_credential_helper [ ] {
    mise use --global github:hickford/git-credential-oauth

    let localGitConfig = local_git_config
    if (^git config -f ($localGitConfig) --get-all credential.helper | complete | get stdout | lines -s | where $it == "oauth" | is-empty) {
        ^git config -f ($localGitConfig) --add credential.helper oauth
    }
    ^git config -f ($localGitConfig) --add credential.oauthRedirectURL http://127.0.0.1:54541
}

export def bootstrap [] {
    ensure_local_gitconfig_property "user.name"
    ensure_local_gitconfig_property "user.email"

    setup_git_oauth_credential_helper

    const vendor_autoload_path = path self ([vendor, autoload, git.nu] | path join)
    cp ($vendor_autoload_path) ([$nu.data-dir, vendor, autoload, git.nu] | path join)
}

def main [] {
    bootstrap
}
