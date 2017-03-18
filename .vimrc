set encoding=utf-8
scriptencoding utf-8

augroup vimrc
  autocmd!
augroup END

" Leader
let g:mapleader="\<Space>"

" Dein
if &compatible
  set nocompatible
endif

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimがなければgithubから落としてくる""""""""""""""""""""""""""""""""""""
if !isdirectory(s:dein_repo_dir)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir
set runtimepath+=~/.vim

" tomlファイルのための設定""""""""""""""""""""""""""""""""""""""""""""""""""""
	call dein#begin(s:dein_dir)
	call dein#load_toml('~/.vim/dein.toml',	{'lazy': 0})
	call dein#load_toml('~/.vim/dein_lazy.toml', {'lazy': 1})
	call dein#end()

" もし，未インストールのものがあったらインストール
if dein#check_install()
	call dein#install()
endif

" 読み込んだプラグインを含め，ファイルタイプの検出,
" ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

runtime! userautoload/*.vim
