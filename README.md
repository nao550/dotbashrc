# dotbashrc

複数の Linux / UNIX 系環境で使うための、最小限の Bash / Zsh 設定セットです。

主な方針:

- Bash / Zsh 共通設定を `~/.shellrc.d/` にまとめる
- シェル固有設定は `60-bashrc.sh` / `70-zshrc.sh` に分離する
- 過度なカスタマイズを避ける
- 複数シェルセッション間で履歴を共有する
- `~/.local/bin` と `~/bin` を PATH に追加する
- Git がない環境でも `curl` / `wget` / `fetch` で導入できるようにする

## インストール

既存の `~/.bashrc` と `~/.zshrc` はタイムスタンプ付きでバックアップされます。

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
.zshrc
.shellrc.d/
├── 05-path.sh
├── 10-history.sh
├── 11-alias.sh
├── 20-nvm.sh
├── 60-bashrc.sh
├── 70-zshrc.sh
└── README.md
install.sh
```

`.bashrc` と `.zshrc` は `~/.shellrc.d/*.sh` をファイル名順に読み込みます。
Bash は `70-zshrc.sh` を、Zsh は `60-bashrc.sh` を除外します。

## 履歴設定

共通ポリシーとして履歴件数を定義し、実際の制御は各シェル固有設定で行います。

Bash:

- `HISTSIZE=10000`
- `HISTFILESIZE=50000`
- 実行日時を `YYYY-MM-DD HH:MM:SS` 形式で表示
- `history -a; history -n` により複数 Bash 間で履歴を共有

Zsh:

- `~/.zsh_history` を使用
- `SAVEHIST=50000`
- `SHARE_HISTORY` により複数 Zsh 間で履歴を共有
