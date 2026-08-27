# .bashrc.d

`~/.bashrc.d/` に置いた通常ファイルは、`.bashrc` からファイル名順に読み込まれます。

用途ごとに Bash 設定を分割するためのディレクトリです。

例:

```text
~/.bashrc.d/
├── 10-aliases.sh
├── 20-functions.sh
├── 50-linux.sh
├── 60-freebsd.sh
├── 80-nvm.sh
└── 90-local.sh
```

## 命名の考え方

先頭に数字を付けると、設定の読み込み順を管理しやすくなります。

- `10-` 基本 alias
- `20-` 共通 function
- `50-` OS / 環境依存設定
- `80-` NVM 等の追加ツール
- `90-` マシン固有設定

`.bashrc.d/` のファイルは現在の Bash プロセスへ `source` されるため、alias、function、環境変数、`shopt` などを設定できます。

## NVM の例

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
```

この内容を Node.js / NVM を使用する環境だけ `80-nvm.sh` として配置できます。
