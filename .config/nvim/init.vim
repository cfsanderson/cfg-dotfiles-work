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

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug '~/.vim/unmanaged-plugins/gruvbox-material'
Plug '~/.vim/unmanaged-plugins/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

call plug#end()

syntax enable
if has('termguicolors')
  set termguicolors
endif

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

"" Markdown Preview
let g:mkdp_auto_start = 0
let g:mkdp_refresh_slow = 0
let g:mkdp_browser = 'Brave Browser'

"" flash yank highlight = great visual feedback
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Gruvbox Material theme
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 0
let g:gruvbox_material_menu_selection_background = 'green'
let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_sign_column_background = 'none'

colorscheme gruvbox-material
set background=dark

"FZF settings
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

"" Airline theme
let g:airline_theme = 'gruvbox_material'

" REMAPS
" Leader
let mapleader = "\<Space>"

" make return and shift+return open  up new lines above and below respectively
" without going into insert mode.
nmap <C-o> O<Esc>
nmap <CR> o<Esc>

" Coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" `gc` comments out a selection

" " Coc-rename
nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

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
