# ~/.bashrc.d/10-history.sh
# Bash の履歴設定。

# 行頭スペースのコマンドと直前と同じコマンドを履歴に残さない。
HISTCONTROL=ignoreboth

# Bash 終了時に履歴ファイルを上書きせず追記する。
shopt -s histappend

# メモリ上に保持する履歴数。
HISTSIZE=10000

# ~/.bash_history に保存する最大履歴数。
HISTFILESIZE=50000

# history 表示時にコマンド実行日時を表示する。
HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S  '

# コマンド実行後に現在の Bash の履歴を書き込み、
# 他の Bash が追加した履歴を読み込む。
# 複数 Bash 間で履歴をほぼリアルタイムに共有できる。
PROMPT_COMMAND='history -a; history -n'
