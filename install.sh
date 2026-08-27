#!/usr/bin/env bash

set -eu

BASE_URL="https://raw.githubusercontent.com/nao550/dotbashrc/main"
BASHRC="$HOME/.bashrc"
BASHRC_D="$HOME/.bashrc.d"

fetch_file() {
    src="$1"
    dest="$2"

    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$src" -o "$dest"
    elif command -v wget >/dev/null 2>&1; then
        wget -qO "$dest" "$src"
    elif command -v fetch >/dev/null 2>&1; then
        fetch -qo "$dest" "$src"
    else
        echo "error: curl, wget, fetch のいずれも見つかりません。" >&2
        exit 1
    fi
}

if [ -e "$BASHRC" ]; then
    backup="$BASHRC.bak.$(date +%Y%m%d%H%M%S)"
    cp -p "$BASHRC" "$backup"
    echo "backup: $BASHRC -> $backup"
fi

mkdir -p "$BASHRC_D"

fetch_file "$BASE_URL/.bashrc" "$BASHRC"

echo "installed: $BASHRC"
echo "directory: $BASHRC_D"
echo
echo "現在の Bash に反映する場合:"
echo "  source ~/.bashrc"
