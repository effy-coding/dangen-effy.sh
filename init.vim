call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jiangmiao/auto-pairs'

Plug 'fatih/vim-go'
Plug 'elixir-lang/vim-elixir'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~.vim/plugged/gocode/vim/symlink.sh' }
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'andrewstuart/vim-kubernetes'

Plug 'NLKNguyen/papercolor-theme'
Plug 'liuchengxu/space-vim-dark'

call plug#end()

set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
set clipboard=unnamedplus
set colorcolumn=81                " highlight the 80th column as an indicator
set completeopt-=preview          " remove the horrendous preview window
set cursorline                    " highlight the current line for the cursor
set encoding=utf-8
set expandtab                     " expands tabs to spaces
set list                          " show trailing whitespace
set listchars=tab:\|\ ,trail:▫
set nospell                       " disable spelling
set noswapfile                    " disable swapfile usage
set nowrap
set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!
set number                        " show number ruler
set relativenumber                " show relative numbers in the ruler
set ruler
set formatoptions=tcqronj         " set vims text formatting options
set softtabstop=2
set tabstop=2
set title                         " let vim set the terminal title
set updatetime=100                " redraw the status bar often
set shiftwidth=4                  " virtual tabstops using spaces
set nocompatible
