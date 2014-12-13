" TODO:
" |- refactor this file
" |- add useful leader mappings
" |- make it portable (themes and so on..)
" '- keep it simple

" setup Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'chriskempson/base16-vim'
" Plugin 'bling/vim-airline'
Plugin 'koron/nyancat-vim'
Plugin 'PotatoesMaster/i3-vim-syntax'

call vundle#end()
filetype plugin indent on

" folding
set foldmethod=marker

" syntax highlighting
syntax on
set t_Co=256
set background=dark
colorscheme base16-bright

" basic settins
set encoding=utf8
set ffs=unix,dos,mac
set ruler
set autoread
set nocompatible
set history=700

" scroll offset
set scrolloff=8

" split the right way
set splitbelow
set splitright

" improve searching
set hlsearch
set incsearch
set showmatch
set mat=2
set ignorecase
set smartcase

" disable annoying swap file
set nobackup
set nowb
set noswapfile

" allow backspace to remove everything
set backspace=indent,eol,start

" use proper tabs
set expandtab
set tabstop=4
set shiftwidth=4

" indentation
set autoindent
set smartindent

" wrap too long lines
set wrap

" mark the leader
nnoremap <space> <NOP>
let mapleader = " "

" source .vimrc
nnoremap <leader>s :source $MYVIMRC<Cr>

" <C-w> sucks
nnoremap <leader>w <C-w>

" jump between buffers
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <Leader>1 :buf 1<CR>
nnoremap <Leader>2 :buf 2<CR>
nnoremap <Leader>3 :buf 3<CR>
nnoremap <Leader>4 :buf 4<CR>
nnoremap <Leader>5 :buf 5<CR>
nnoremap <Leader>6 :buf 6<CR>
nnoremap <Leader>7 :buf 7<CR>
nnoremap <Leader>8 :buf 8<CR>
nnoremap <Leader>9 :buf 9<CR>
nnoremap <Leader>0 :buf 10<CR>

" upper and lower case word
nnoremap <leader>u viwu
nnoremap <leader>U viwU

" surround word
nnoremap <leader>" ciw"<C-r>""<esc>
nnoremap <leader>' ciw'<C-r>"'<esc>
nnoremap <leader>{ ciw{<C-r>"}<esc>
nnoremap <leader>( ciw(<C-r>")<esc>
nnoremap <leader>[ ciw[<C-r>"]<esc>
nnoremap <leader>< ciw<<C-r>"><esc>

" surround selection
vnoremap <leader>" c"<C-r>""<esc>
vnoremap <leader>' c'<C-r>"'<esc>
vnoremap <leader>{ c{<C-r>"}<esc>
vnoremap <leader>( c(<C-r>")<esc>
vnoremap <leader>[ c[<C-r>"]<esc>
vnoremap <leader>< c<<C-r>"><esc>

" force hjkl
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" easier navigation
nnoremap H 0
nnoremap L $
nnoremap J <C-d>
nnoremap K <C-u>

" pasting with mouse
set pastetoggle=<f5>

" add statusline
set noruler
set laststatus=2

set statusline=
set statusline+=%-2.2n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" mark too long lines
autocmd BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%81v', -1)
autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)

" highlight whitespace
set listchars=tab:>~,nbsp:_,trail:.
set list

" filetype stuff
autocmd BufRead,BufNewFile *.sig set filetype=cpp
autocmd FileType make setlocal noexpandtab
