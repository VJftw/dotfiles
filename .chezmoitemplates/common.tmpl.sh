#!/usr/bin/env bash
set -Eeuo pipefail

log::info() {
    >&2 printf "💡 %s\n" "$@"
}

log::warn() {
    >&2 printf "⚠️ %s\n" "$@"
}

log::error() {
   >&2 printf "❌ %s\n" "$@"
}

log::success() {
   >&2 printf "✅ %s\n" "$@"
}

export PATH="${PATH}:${HOME}/.local/bin"
