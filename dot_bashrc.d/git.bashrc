if ! command -v git >/dev/null 2>&1; then
  return
fi

git_main_branch() {
  if ! git rev-parse --git-dir >/dev/null; then
    return
  fi

  for p1 in "heads" "remotes"; do
    for p2 in "origin" "upstream"; do
      for p3 in "main" "master" "trunk" "mainline" "default" "stable"; do
        ref="refs/$p1/$p2/$p3"

        if git show-ref -q --verify "$ref"; then
          printf '%s\n' "$p3"
          return
        fi
      done
    done
  done

  printf '%s\n' "master"
}


alias gst='git status'
alias gco='git checkout'
alias gcm="gco \$(git_main_branch)"
