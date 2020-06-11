"===============================================================================
"                / _|                   | |
"            ___| |_ ___  __ _ _ __   __| | ___ _ __ ___  ___  _ __
"           / __|  _/ __|/ _` | '_ \ / _` |/ _ \ '__/ __|/ _ \| '_ \
"          | (__| | \__ \ (_| | | | | (_| |  __/ |  \__ \ (_) | | | |
"           \___|_| |___/\__,_|_| |_|\__,_|\___|_|  |___/\___/|_| |_|
"===============================================================================

syntax on

set belloff=all
set display+=lastline
set incsearch
set nobackup
set noerrorbells
set noswapfile
set nowrap
set number relativenumber
set scrolloff=5
set sidescrolloff=5
set shiftwidth=2
set smartindent
set smartcase
set splitbelow
set splitright
set tabstop=2 softtabstop=2 expandtab
set undodir=~/.vim/undodir

highlight Comment cterm=italic

" NERDTREE
autocmd StdinReadPre * let s:std_in=1
"w Open NERDTree by default when vim starts up if no files specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Automatically close a tab if NerdTree is the last thing running
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'leafgarland/typescript-vim'
Plug '~/.vim/unmanaged-plugins/gruvbox-material'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug '~/.vim/unmanaged-plugins/vim-javascript'

call plug#end()

syntax enable
if has('termguicolors')
  set termguicolors
endif

" Gruvbox Material theme
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 0
let g:gruvbox_material_menu_selection_background = 'green'
let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_sign_column_background = 'none'

colorscheme gruvbox-material
set background=dark

" Markdown Preview
let g:mkdp_auto_start = 0
let g:mkdp_refresh_slow = 0
let g:mkdp_browser = 'Brave Browser'

let g:airline_theme = 'gruvbox_material'

" Goyo settings
let g:goyo_width = 120
function! s:goyo_enter()
  set wrap
  set linebreak
  set noshowmode
  set noshowcmd
  set scrolloff=999
  execute "MarkdownPreview"
endfunction

function! s:goyo_leave()
  set nowrap
  set nolinebreak
  set showmode
  set showcmd
  set scrolloff=5
  execute "MarkdownPreviewStop"
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" REMAPS
let mapleader = "\<Space>"

" save & quit
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>

" toggle NERDTree
map <leader>n :NERDTreeToggle<cr>

" open FZF
map <leader>f :FZF

" using * to search or visual selection this enters the replace command and
" puts your cursor in line to accept the term to replace
nnoremap <leader>r :%s///g<left><left>
nnoremap <leader>rc :%s///gc<left><left>

" source current file
nnoremap <leader>so :source %<cr>

" remap normal copy/paste keys to vim registers
vnoremap <C-c> "+y
noremap <C-p> "+p

" vim-fugitive - git workflow
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

" remap change split to just ctrl + {h,j,k,l}
map <C-H> <C-W><C-H>
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
