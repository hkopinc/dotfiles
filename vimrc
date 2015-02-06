set nocompatible
syntax on                   " syntax higlihting
colorscheme desert          "colorscheme

" indents and tabs
set autoindent              " Carries over previous indent to the next line
set smartindent             " try to be smart about indenting (C-style)
set expandtab               " Tab key inserts spaces instead of tabs
set shiftwidth=4            " Sets spaces used for (auto)indent
set tabstop=4               " Sets the tab size to 4
set shiftround              " Indent to nearest tabstop
set copyindent              " use existing indents for new indents
set preserveindent          " save as much indent structure as possible
filetype plugin indent on   " load filetype plugins and indent settings

set number                      " line numbers
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set showmode                    " always show what mode we're currently editing in
set laststatus=2                " status line
set showmatch                   " Show matching brackets.
set ignorecase                  " Do case insensitive matching
set smartcase                   " Do smart case matching
set incsearch                   " Incremental search
set hlsearch                    " highlight search
set nobackup                    " no backup file
set showcmd                     " show partial command
set hidden                      " Hide buffers when they are abandoned
set wildmode=longest,list       " bash like command line
set ruler                       " show row,col in status area
set cursorline                  " show current line
set history=100

" command typos
command! -bang -nargs=? -complete=file E e<bang> <args>
command! -bang -nargs=? -complete=file W w<bang> <args>
command! -bang -nargs=? -complete=file Wq wq<bang> <args>
command! -bang -nargs=? -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
