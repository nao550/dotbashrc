# ~/.shellrc.d/05-path.sh
# Bash / Zsh 共通 PATH 設定。

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
