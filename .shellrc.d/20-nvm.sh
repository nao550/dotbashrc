# ~/.shellrc.d/20-nvm.sh
# Bash / Zsh 共通の NVM (Node Version Manager) 初期化設定。

export NVM_DIR="$HOME/.nvm"

# NVM 本体が存在する場合のみ読み込む。
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
