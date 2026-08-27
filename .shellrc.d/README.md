# .shellrc.d

Bash / Zsh から共通で読み込む設定ディレクトリです。

## 現在の構成

```text
~/.shellrc.d/
├── 05-path.sh
├── 10-history.sh
├── 11-alias.sh
├── 20-nvm.sh
├── 60-bashrc.sh
└── 70-zshrc.sh
```

## 方針

- 共通設定は通常の番号付きファイルへ置く
- Bash 固有設定は `60-bashrc.sh`
- Zsh 固有設定は `70-zshrc.sh`
- `.bashrc` は `70-zshrc.sh` を除外して読み込む
- `.zshrc` は `60-bashrc.sh` を除外して読み込む

## ファイルの役割

- `05-path.sh`: PATH など共通環境設定
- `10-history.sh`: 共通の履歴ポリシー値
- `11-alias.sh`: Bash / Zsh 共通 alias
- `20-nvm.sh`: NVM 本体の共通初期化
- `60-bashrc.sh`: Bash の履歴制御、プロンプト、補完など
- `70-zshrc.sh`: Zsh の履歴制御、プロンプト、補完など

追加ファイルは `.sh` 拡張子で配置するとファイル名順に読み込まれます。
