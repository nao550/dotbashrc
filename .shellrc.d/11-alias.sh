# ~/.shellrc.d/11-alias.sh
# Bash / Zsh 共通 alias 設定。

# GNU dircolors が存在する環境では ls / grep のカラー表示を有効にする。
if [ -x /usr/bin/dircolors ]; then
    if [ -r "$HOME/.dircolors" ]; then
        eval "$(dircolors -b "$HOME/.dircolors")"
    else
        eval "$(dircolors -b)"
    fi

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias less='less -X'

# Vim がインストールされている環境では vi で Vim を起動する。
# Vim がない場合は alias を設定せず、OS 標準の vi をそのまま使用する。
if command -v vim >/dev/null 2>&1; then
    alias vi='vim'
fi
