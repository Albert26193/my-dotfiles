" =================================
" ============ Basic Settings ===========
" =================================
set number            " Enable line numbers
set nocompatible      " Set non-compatible with vi
syntax on             " Enable syntax highlighting
set showcmd           " Show command in status line
set encoding=utf-8    " Set encoding to utf-8
set t_Co=256          " Set color to 256 colors
filetype indent on    " Enable filetype indent
set autoindent        " Set auto-indent
set tabstop=2         " Number of spaces for displaying a tab
set shiftwidth=4      " Set number of spaces for << indenting
set expandtab         " Convert tabs to spaces
set softtabstop=2     " Number of spaces a <Tab> counts for

" =================================
" ============ Appearance Settings ===========
" =================================
set textwidth=80      " Set the width of a line
set wrap              " Enable line wrapping
set linebreak         " Break lines only at certain characters
set scrolloff=5       " Number of lines to keep above and below cursor
set laststatus=2      " Always show status line
set ruler             " Show the cursor position in the status line
set showmatch         " Highlight matching parentheses
set hlsearch          " Highlight search results
set incsearch         " Jump to matching position as you type
set ignorecase        " Ignore case when searching
set wildmenu          " Enable vim command-line completion
set wildmode=longest:list,full
