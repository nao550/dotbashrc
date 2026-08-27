# dotbashrc

複数の Linux / UNIX 系環境で使うための、最小限の Bash 設定セットです。

主な方針:

- Bash 標準機能を中心にする
- 過度なカスタマイズを避ける
- 複数 Bash セッション間で履歴を共有する
- `~/.local/bin` と `~/bin` を PATH に追加する
- 追加設定は `~/.bashrc.d/` に分離する
- Git がない環境でも `curl` で導入できるようにする

## インストール

既存の `~/.bashrc` はタイムスタンプ付きでバックアップされます。

```sh
curl -fsSL https://raw.githubusercontent.com/nao550/dotbashrc/main/install.sh | bash
```

スクリプトを確認してから実行する場合:

```sh
curl -fsSL https://raw.githubusercontent.com/nao550/dotbashrc/main/install.sh -o /tmp/dotbashrc-install.sh
less /tmp/dotbashrc-install.sh
bash /tmp/dotbashrc-install.sh
```

## 構成

```text
.bashrc
.bashrc.d/
  README.md
install.sh
```

`~/.bashrc.d/` 以下の通常ファイルはファイル名順に読み込まれます。
必要に応じて次のようなファイルを追加できます。

```text
~/.bashrc.d/
├── 10-aliases.sh
├── 20-functions.sh
├── 80-nvm.sh
└── 90-local.sh
```

## 履歴設定

- `HISTSIZE=10000`
- `HISTFILESIZE=50000`
- 実行日時を `YYYY-MM-DD HH:MM:SS` 形式で表示
- `history -a; history -n` により複数 Bash 間で履歴を共有

完全なリアルタイム同期ではなく、各 Bash がプロンプトを表示するタイミングで履歴が同期されます。
