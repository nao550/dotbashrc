# ~/.shellrc.d/60-bashrc.sh
# Bash 固有設定。

# =============================================================================
# コマンド履歴
# =============================================================================

# 行頭スペースのコマンドと直前と同じコマンドを履歴に残さない。
HISTCONTROL=ignoreboth

# Bash 終了時に履歴ファイルを上書きせず追記する。
shopt -s histappend

# 共通履歴ポリシーの値を Bash に反映する。
HISTSIZE=${SHELL_HISTORY_SIZE:-10000}
HISTFILESIZE=${SHELL_HISTORY_FILE_SIZE:-50000}

# history 表示時にコマンド実行日時を表示する。
HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S  '

# コマンド実行後に現在の Bash の履歴を書き込み、
# 他の Bash が追加した履歴を読み込む。
PROMPT_COMMAND='history -a; history -n'

# =============================================================================
# ターミナル
# =============================================================================

# ターミナルサイズ変更時に LINES / COLUMNS を更新する。
shopt -s checkwinsize

# ** を再帰的な glob として使用したい場合は有効化する。
#shopt -s globstar

# lesspipe が存在する場合は有効化する。
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# =============================================================================
# プロンプト
# =============================================================================

case "$TERM" in
    xterm-color|*-256color)
        color_prompt=yes
        ;;
esac

#force_color_prompt=yes

if [ -n "${force_color_prompt:-}" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "${color_prompt:-}" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;\u@\h: \w\a\]$PS1"
        ;;
esac

# =============================================================================
# Bash 固有 alias / 補完
# =============================================================================

# GUI 環境で notify-send が利用できる場合、直前の処理結果を通知する。
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# 従来形式の ~/.bash_aliases が存在する場合は読み込む。
if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

# bash-completion がインストールされていれば有効化する。
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# NVM 用の Bash 補完が存在する場合のみ読み込む。
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
