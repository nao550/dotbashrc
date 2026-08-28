" ==============================================================================
" 基本設定
" ==============================================================================
set nocompatible                " Vi互換モードを無効
set encoding=utf-8              " 文字エンコーディング
set fileencoding=utf-8          " ファイル保存時の文字エンコーディング
set number                      " 行番号表示
set relativenumber              " 相対行番号表示
set cursorline                  " 現在行をハイライト
set showmatch                   " 対応する括弧をハイライト
set ruler                       " ルーラー表示

" ==============================================================================
" インデント設定
" ==============================================================================
set tabstop=4                   " タブ幅
set shiftwidth=4                " 自動インデント幅
set expandtab                   " タブをスペースに展開
set autoindent                  " 自動インデント
set smartindent                 " スマートインデント

" ==============================================================================
" 検索設定
" ==============================================================================
set hlsearch                    " 検索結果をハイライト
set incsearch                   " インクリメンタル検索
set ignorecase                  " 大文字小文字を区別しない
set smartcase                   " 大文字が含まれる場合は区別する

" ==============================================================================
" 表示設定
" ==============================================================================
syntax on                       " シンタックスハイライト
set background=dark             " 背景色
colorscheme desert              " カラースキーム
set laststatus=2                " ステータスライン常に表示

" ==============================================================================
" キーマッピング
" ==============================================================================
" Escキーの代替
inoremap jj <Esc>

" 検索ハイライトを無効化
nnoremap <Esc><Esc> :nohlsearch<CR>

" ファイル保存
nnoremap <C-s> :w<CR>

" ==============================================================================
" プログラミング用の設定
" ==============================================================================
" Python用設定
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab

" JavaScript用設定
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab

" HTML用設定
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab

" ==============================================================================
" プラグイン管理 (vim-plug)
" ==============================================================================
" 初回導入後に以下を実行してプラグインをインストールする。
"   :PlugInstall
"
" 更新:
"   :PlugUpdate
"
" .vimrc から削除したプラグインを実体から削除:
"   :PlugClean
call plug#begin('~/.vim/plugged')

" ファイルエクスプローラー
Plug 'preservim/nerdtree'

" ファジーファインダー
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git統合
Plug 'tpope/vim-fugitive'

call plug#end()

" ==============================================================================
" プラグイン使用例
" ==============================================================================
" NERDTree
" nnoremap <C-n> :NERDTreeToggle<CR>

" fzf.vim
" :Files      ファイル検索
" :Buffers    バッファ検索
" :Rg         テキスト検索（ripgrepが必要）

" vim-fugitive
" :Git        Git操作
" :Gdiffsplit diff表示
