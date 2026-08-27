# ~/.bashrc
# Bash 用エントリポイント。
# 共通設定は ~/.shellrc.d/ から読み込む。

# 非対話シェルでは以降の設定を読み込まない。
case $- in
    *i*) ;;
      *) return ;;
esac

SHELLRC_D="$HOME/.shellrc.d"

if [ -d "$SHELLRC_D" ]; then
    for rc in "$SHELLRC_D"/*.sh; do
        [ -f "$rc" ] || continue

        # Zsh 固有設定は Bash では読み込まない。
        case "$rc" in
            */70-zshrc.sh) continue ;;
        esac

        . "$rc"
    done
fi

unset rc SHELLRC_D
