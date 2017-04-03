" Enable modern Vim features not compatible with Vi spec.
set nocompatible

" begin edits from brianrc

" ===== Plugins
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Aesthetics
Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-two-firewatch'
Plug 'rakr/vim-one'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'Shougo/unite.vim'
Plug 'google/vim-colorscheme-primary'

Plug 'uarun/vim-protobuf'

" Color the gutter with changed lines info
Plug 'mhinz/vim-signify'

" Tag management and usage
Plug 'majutsushi/tagbar'

" AutoCompletion via YouCompleteMe
Plug 'valloric/youcompleteme'

call plug#end()
" ===== End Vim-Plug Plugins

set t_Co=256

" Wrap autocmds inside an augroup to protect against reloading this script.
" For more details, see:
" http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
augroup autoformat
  autocmd!
  " Autoformat BUILD files on write.
  autocmd FileType bzl AutoFormatBuffer buildifier
  " Autoformat go files on write.
  autocmd FileType go AutoFormatBuffer gofmt
  " Autoformat proto files on write.
  autocmd FileType proto AutoFormatBuffer clang-format
  " Autoformat c and c++ files on write.
  autocmd FileType c,cpp AutoFormatBuffer clang-format
augroup END

" non-plugin settings
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
"set clipboard=unnamedplus                                    " yank and paste with the system clipboard
set encoding=utf-8
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set hlsearch
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=4                                             " normal mode indentation commands use 4 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 4 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set cursorline
set mouse=a

" Remap the leader key
let mapleader=','

" Insert-mode mappings
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I
inoremap <C-f> <Esc>la
inoremap <C-b> <Esc>i
" inoremap <C-d> <Esc>lxi
inoremap <C-d> <C-O>x
inoremap jj <Esc>
inoremap kk <Esc>

" ============================
" === Normal-mode mappings ===
" ============================

" Search for files in current working directory (search [f]iles)
nnoremap <Leader>f :Unite -start-insert file<CR>
" Search for files in current working directory, recursively (search
" [r]ecursively)
nnoremap <Leader>r :Unite -start-insert file_rec<CR>
" Search open buffers (search [b]uffers)
nnoremap <Leader>b :Unite -start-insert buffer<CR>
" Search among lines in current buffer (search [l]ines)
nnoremap <Leader>l :Unite -buffer-name=search -start-insert line<cr>
" Search for files in directory of current buffer (search [h]ere)
nnoremap <Leader>h :UniteWithBufferDir -start-insert file<CR>

" Trim trailing whitespace in a file
nnoremap <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Call syntastic
nnoremap <Leader>/ :SyntasticCheck<CR>

" Unite searches using ag
"let g:unite_source_grep_command = 'ag'
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" === Syntastic settings ===
let g:syntastic_check_on_wq = 1
"let g:syntastic_error_symbol = "<U+1F4A9>"

" === Extra commands ===

" g4 fix when you save
function MyFormatChangedLines()
  !g4 fix %
  edit
endfunction
"autocmd BufWritePost,FileWritePost *.java call MyFormatChangedLines()

" Aesthetics
" === Airline ===
"let g:airline_theme='one'
"vim-airline: enable powerline symbols
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Fonts and colors
"set background=light
"colorscheme solarized
colorscheme space-vim-dark

" end edits from brianrc
syntax on
filetype plugin indent on
