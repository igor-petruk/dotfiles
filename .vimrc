
set nocompatible              " be iMproved, required
filetype off                  " required

set shell=/bin/bash

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tComment'
Plugin 'tpope/vim-pathogen'
Plugin 'jdevera/vim-protobuf-syntax'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'localvimrc'
Plugin 'flazz/vim-colorschemes'
Plugin 'stephanedemotte/beekai'
Plugin 'sickill/vim-monokai'
Plugin 'mattn/webapi-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mattn/gist-vim'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
" Plugin 'mhinz/vim-signify'
" Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'ryanoasis/vim-webdevicons'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'bendavis78/vim-polymer'
Plugin 'kchmck/vim-coffee-script'
call vundle#end()            " required

call pathogen#infect() 

if filereadable(expand('~/.vimrc_google'))
   source ~/.vimrc_google
else
   Plugin 'Valloric/YouCompleteMe'
   let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
endif

filetype plugin indent on    " required

filetype plugin on
syntax on

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
let g:airline_powerline_fonts=1
let g:airline_theme='tomorrow'


" autocmd VimEnter * nested :call tagbar#autoopen(1)
" autocmd FileType * nested :call tagbar#autoopen(0)

set mouse=a

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
" set relativenumber
set number
set showmatch
set hlsearch
set nobackup
set nowb
set noswapfile
set nospell
set laststatus=2
set t_Co=256
colorscheme beekai
highlight ColorColumn ctermbg=7

let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_echo_current_diagnostic = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_blacklist = {
      \  "python": 1
      \ }
autocmd FileType cpp nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = "0"
let g:jedi#popup_select_first = 0
set completeopt=menu,longest,preview
autocmd FileType python setlocal completeopt-=preview

nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i
map <F3> <C-W>w
map <F4> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>
inoremap <C-@> <C-Space>
map <F7> :make<CR>
map <S-F7> :make clean all<CR>
map <F8> :make! run<CR>
map <F10> :sh<CR>
" map <C-n> :NERDTreeToggle<CR>
map <C-t> :TagbarToggle<CR>
map <C-p> :FZF<CR>
nnoremap <buffer> <CR> <C-]>
nmap [D <C-W>h
nmap [C <C-W>l

let g:localvimrc_sandbox=0
let g:localvimrc_persistent=2

let g:gist_post_anonymous = 1
let g:gist_post_private = 1

augroup filetype
au! BufRead,BufNewFile *.proto setfiletype proto
augroup end
