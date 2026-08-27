# ~/.bashrc.d/11-alias.sh
# 共通 alias 設定。

# GNU dircolors が存在する環境では ls / grep のカラー表示を有効にする。
# FreeBSD 標準の ls では --color=auto ではなく -G を使用するため、
# FreeBSD 固有設定を追加する場合は別ファイルで上書きする。
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

# ls の表示形式を簡略化した alias。
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# less 終了後も画面をクリアせず、表示内容をターミナルに残す。
alias less='less -X'

# GUI 環境で notify-send が利用できる場合、直前の処理結果を通知する。
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# 従来形式の ~/.bash_aliases が存在する場合は最後に読み込む。
# 同名 alias があれば ~/.bash_aliases 側の定義が優先される。
if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi
