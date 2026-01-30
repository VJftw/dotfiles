def --wrapped git [...rest] {
    if $rest == ["log"] {
        # From: https://www.nushell.sh/cookbook/parsing_git_log.html
        ^git log --pretty=%H»¦«%s»¦«%aN»¦«%aE»¦«%aD -n 25 |
            lines |
            split column "»¦«" commit subject name email date |
            upsert date {|d| $d.date | into datetime} |
            sort-by date |
            reverse |
            explore

        return
    }

    ^git ...$rest
}

# Determine Git Main Branch.
# Adapted from [ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/blob/9957e4e8be9d63b9c42673f0eb86fa2dea845b32/plugins/git/git.plugin.zsh#L35-L48)
def git_main_branch [] {
  if (git rev-parse --git-dir | complete).exit_code != 0 {
    return
  }

  for p1 in ["heads", "remotes"] {
    for p2 in ["origin", "upstream"] {
      for p3 in ["main", "master", "trunk", "mainline", "default", "stable"] {
        let ref = $"refs/($p1)/($p2)/($p3)"
        if (git show-ref -q --verify $ref | complete).exit_code == 0 {
          return $p3
        }
      }
    }
  }

  # if no default branch found, fallback to "master"
  return "master"
}

alias gst = git status
alias gco = git checkout
alias gcm = gco (git_main_branch)
