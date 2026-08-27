# ~/.bashrc.d/20-nvm.sh
# NVM (Node Version Manager) の初期化設定。

export NVM_DIR="$HOME/.nvm"

# NVM 本体が存在する場合のみ読み込む。
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# NVM 用の Bash 補完が存在する場合のみ読み込む。
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
