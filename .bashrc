# ~/.bashrc
# 複数環境で使うことを想定した最小限の Bash 設定。

# 非対話シェルでは以降の設定を読み込まない。
case $- in
    *i*) ;;
      *) return ;;
esac

# =============================================================================
# ユーザー専用コマンドの PATH
# =============================================================================

# ~/.local/bin と ~/bin を PATH の先頭へ追加する。
# 既に含まれている場合は重複して追加しない。
case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) PATH="$HOME/.local/bin:$PATH" ;;
esac

case ":$PATH:" in
    *":$HOME/bin:"*) ;;
    *) PATH="$HOME/bin:$PATH" ;;
esac

export PATH

# =============================================================================
# ターミナル
# =============================================================================

# ターミナルサイズ変更時に LINES / COLUMNS を更新する。
shopt -s checkwinsize

# ** を再帰的な glob として使用したい場合は有効化する。
#shopt -s globstar

# =============================================================================
# less
# =============================================================================

# lesspipe が存在する場合は有効化する。
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# =============================================================================
# プロンプト
# =============================================================================

# カラー表示可能なターミナルではカラープロンプトを使用する。
case "$TERM" in
    xterm-color|*-256color)
        color_prompt=yes
        ;;
esac

# 必要なら TERM 判定に関係なくカラープロンプトを試す。
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# \u: ユーザー名 / \h: ホスト名 / \w: 現在ディレクトリ
# \$: 一般ユーザーは $、root は #
if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

# xterm / rxvt 系ではターミナルタイトルへユーザー名・ホスト名・PWDを表示する。
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;\u@\h: \w\a\]$PS1"
        ;;
esac

# =============================================================================
# 共通追加設定
# =============================================================================

# ~/.bashrc.d/ 配下の通常ファイルをファイル名順に読み込む。
# 例: 10-history.sh, 11-alias.sh, 20-functions.sh, 80-nvm.sh, 90-local.sh
if [ -d "$HOME/.bashrc.d" ]; then
    for rc in "$HOME"/.bashrc.d/*; do
        [ -f "$rc" ] && . "$rc"
    done
fi
unset rc

# =============================================================================
# bash-completion
# =============================================================================

# bash-completion がインストールされていれば有効化する。
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
