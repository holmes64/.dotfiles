set shell=/bin/zsh
set shiftwidth=4
set tabstop=4
set expandtab
set textwidth=0
set autoindent
set hlsearch
set number
set clipboard&
set clipboard^=unnamedplus
syntax on

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntk148v/vim-horizon'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
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

" vim-airline-settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16-spacemacs'

nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
 
" easymotion
map f <Plug>(easymotion-fl))
map t <Plug>(easymotion-tl))
map F <Plug>(easymotion-Fl))
map T <Plug>(easymotion-Tl))

