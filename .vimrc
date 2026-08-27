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
inoremap jj &lt;Esc>
" 検索ハイライトを無効化
nnoremap &lt;Esc>&lt;Esc> :nohlsearch&lt;CR>
" ファイル保存
nnoremap &lt;C-s> :w&lt;CR>

"===============================================================================
" プログラミング用の設定
"===============================================================================
" Python用設定
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab

" JavaScript用設定
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab

" HTML用設定
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab

"===============================================================================
" プラグイン
":PlugInstall を実行してプラグインをインストール
":PlugClean プラグインをコメントアウトして実行してプラグインをアンインストール
"===============================================================================
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

" Vundle 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
call vundle#end()

" ファイルエクスプローラー：NERDTree
Plug 'preservim/nerdtree'

" 設定例
"nnoremap &lt;C-n> :NERDTreeToggle&lt;CR>

" ファジーファインダー：fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" 使用例
":Files      " ファイル検索
":Buffers    " バッファ検索
":Rg         " テキスト検索（ripgrepが必要）

" Git統合：vim-fugitive
Plug 'tpope/vim-fugitive'
" 使用例
":Gstatus    " git status
":Gcommit    " git commit
":Gdiff      " git diff
