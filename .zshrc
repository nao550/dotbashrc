# ~/.zshrc
# Zsh 用エントリポイント。
# 共通設定は ~/.shellrc.d/ から読み込む。

SHELLRC_D="$HOME/.shellrc.d"

if [ -d "$SHELLRC_D" ]; then
    for rc in "$SHELLRC_D"/*.sh; do
        [ -f "$rc" ] || continue

        # Bash 固有設定は Zsh では読み込まない。
        case "$rc" in
            */60-bashrc.sh) continue ;;
        esac

        . "$rc"
    done
fi

unset rc SHELLRC_D
