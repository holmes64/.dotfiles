set shell=/bin/zsh
set shiftwidth=4
set tabstop=4
set expandtab
set textwidth=0
set autoindent
set hlsearch
set number
set clipboard=unnamed
syntax on

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntk148v/vim-horizon'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif


" if you don't set this option, this color might not correct
set termguicolors

colorscheme horizon

" lightline
let g:lightline = {}
let g:lightline.colorscheme = 'horizon'

" or this line
let g:lightline = {'colorscheme' : 'horizon'}

" gitgutter
let g:gitgutter_sign_allow_clobber = 1

" vim-airline
let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
 
"左側に使用されるセパレータ
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
"右側に使用されるセパレータ
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.crypt = '🔒'		" 暗号化されたファイル
let g:airline_symbols.linenr = '¶'		" 行
let g:airline_symbols.maxlinenr = '㏑'	" 最大行
let g:airline_symbols.branch = '⭠'		" gitブランチ
let g:airline_symbols.paste = 'ρ'		" ペーストモード
let g:airline_symbols.spell = 'Ꞩ'		"スペルチェック
let g:airline_symbols.notexists = '∄'	"gitで管理されていない場合
let g:airline_symbols.whitespace = 'Ξ'	" 空白の警告(余分な空白など)


