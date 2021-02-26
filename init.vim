"base setting
syntax enable
syntax on
filetype indent on
set t_Co=256
set termguicolors
set smartindent
set termencoding=utf-8
set fileformats=unix
set encoding=utf-8
set mouse=nv
set number
set tabstop=4
set shiftwidth=4
set ts=4
set expandtab
set autoindent
set showcmd
set noswapfile
set showmatch
set ruler
set wrap
set noshowmode
set showtabline=1
set smartcase
set notimeout
set ttimeoutlen=0
set lazyredraw
set visualbell
set history=800
set scrolloff=5
set hlsearch
set incsearch
"set cursorline
set list
set listchars=tab:\┆\ ,trail:-
"hi CursorLine ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set viewoptions=cursor,folds,slash,unix
set wildmenu
set wildmode=full
"set wildchar=<Tab>
set guicursor=n:block,i:ver1,v:block,r:block,c:block,ci:block,cr:block
set relativenumber
set path=.,/usr/include,/usr/local/include/
set foldmethod=marker
set foldlevelstart=99
set nobackup
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"let g:mapleader = "\<Space>"

"color 
colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=None

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
""If you're using tmux version 2.2 or later, you can remove the outermost
"$TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more
"information.)
if (empty($TMUX))
  if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 <https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 <https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162>
  "Based on Vim patch 7.4.1770 (`guicolors` option) <https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd>
  " <https://github.com/neovim/neovim/wiki/Following-HEAD#20160511>
  if (has("termguicolors"))
      set termguicolors
  endif
endif

" pecify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" plugs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gcmt/wildfire.vim'

" Initialize plugin system
call plug#end()

"coc.nvim
set hidden
set updatetime=300
set shortmess+=c
"Always show the signcolumn, otherwise it would shift the text each time
"diagnostics appear/become resolved.
if has("patch-8.1.1564")
"Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=no
endif
"GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"Applying codeAction to the selected region.
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

"Make <tab> used for trigger completion, completion confirm, snippet expand
"and jump like VSCode.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

"coc-explorer
nmap <C-b> :CocCommand explorer --sources=buffer+,file+ --position=left<CR>

"floaterm
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_new    = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_next   = '<F4>'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

nnoremap  <silent> <C-g>  :FloatermNew lazygit<CR>

"airline
let g:airline_powerline_fonts = 1 
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#left_sep = '<<'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = '>>'
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let laststatus = 2

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
let g:airline_symbols.space = "\ua0"

"to workspace
cd /mnt/e/workspace
