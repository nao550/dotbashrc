#!/usr/bin/env bash

set -eu

BASE_URL="https://raw.githubusercontent.com/nao550/dotbashrc/main"
VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

BASHRC="$HOME/.bashrc"
ZSHRC="$HOME/.zshrc"
VIMRC="$HOME/.vimrc"
VIM_AUTOLOAD="$HOME/.vim/autoload"
VIM_PLUG="$VIM_AUTOLOAD/plug.vim"
SHELLRC_D="$HOME/.shellrc.d"
OLD_BASHRC_D="$HOME/.bashrc.d"

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

backup_file() {
    file="$1"

    if [ -e "$file" ]; then
        backup="$file.bak.$(date +%Y%m%d%H%M%S)"
        cp -p "$file" "$backup"
        echo "backup: $file -> $backup"
    fi
}

backup_file "$BASHRC"
backup_file "$ZSHRC"
backup_file "$VIMRC"

mkdir -p "$SHELLRC_D"
mkdir -p "$VIM_AUTOLOAD"

fetch_file "$BASE_URL/.bashrc" "$BASHRC"
fetch_file "$BASE_URL/.zshrc" "$ZSHRC"
fetch_file "$BASE_URL/.vimrc" "$VIMRC"
fetch_file "$BASE_URL/.shellrc.d/05-path.sh" "$SHELLRC_D/05-path.sh"
fetch_file "$BASE_URL/.shellrc.d/10-history.sh" "$SHELLRC_D/10-history.sh"
fetch_file "$BASE_URL/.shellrc.d/11-alias.sh" "$SHELLRC_D/11-alias.sh"
fetch_file "$BASE_URL/.shellrc.d/20-nvm.sh" "$SHELLRC_D/20-nvm.sh"
fetch_file "$BASE_URL/.shellrc.d/60-bashrc.sh" "$SHELLRC_D/60-bashrc.sh"
fetch_file "$BASE_URL/.shellrc.d/70-zshrc.sh" "$SHELLRC_D/70-zshrc.sh"

# vim-plug 本体がない場合のみ導入する。
if [ ! -s "$VIM_PLUG" ]; then
    fetch_file "$VIM_PLUG_URL" "$VIM_PLUG"
    echo "installed: $VIM_PLUG"
fi

# 旧 ~/.bashrc.d の本リポジトリ由来ファイルが残っている場合は削除する。
rm -f \
    "$OLD_BASHRC_D/10-history.sh" \
    "$OLD_BASHRC_D/10-alias.sh" \
    "$OLD_BASHRC_D/11-alias.sh" \
    "$OLD_BASHRC_D/20-nvm.sh"

# 空になった場合のみ旧ディレクトリを削除する。
rmdir "$OLD_BASHRC_D" 2>/dev/null || true

echo "installed: $BASHRC"
echo "installed: $ZSHRC"
echo "installed: $VIMRC"
echo "installed: $SHELLRC_D"
echo
echo "Vim プラグインを初回インストールする場合:"
echo "  vim +PlugInstall +qall"
echo
echo "現在のシェルに反映する場合:"
echo "  Bash: source ~/.bashrc"
echo "  Zsh : source ~/.zshrc"
