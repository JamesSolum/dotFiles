set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nightsense/seabird'
Plugin 'scrooloose/nerdtree'
Plugin 'ayu-theme/ayu-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Siphalor/vim-atomified'
Plugin 'ngmy/vim-rubocop'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/file-line'

Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'tomasr/molokai'

"Tags
"Plugin 'ludovicchabant/vim-gutentags'
"Plugin 'kien/ctrlp.vim'

" Ruby / Rails
Plugin 'tpope/vim-rails'
Plugin 'lucapette/vim-ruby-doc'
Plugin 'tpope/vim-rbenv'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Enable Folding
"set foldmethod=indent
"set foldlevel=99
" Enable folding with spacebar
nnoremap <space> za

"Tagbar remap
nmap <F8> :TagbarToggle<CR>

" Split navigation remapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Python Formatting
au BufNewFile,BufRead *.py
            \set tabstop=4
            \set softtabstop=4
            \set shiftwidth=4
            \set textwidth=79
            \set expandtab
            \set autoindent
            \set fileformat=unix

"Nerd Tree
map <C-n> :NERDTreeToggle<CR> 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Auto-open Nerd tree

"Other things
syntax on  
set smartindent
inoremap <Nul> <C-n>
set mouse=a
set number
set background=dark

"For Powerline to appear in single windows
set laststatus=2
set backspace=indent,eol,start

" Colors!
set termguicolors
let ayucolor="dark"
colorscheme molokai
let g:airline_theme='ayu'

"For Ruby Indentation
:autocmd Filetype ruby set softtabstop=2
:autocmd Filetype ruby set expandtab
:autocmd Filetype ruby set sw=2
:autocmd Filetype ruby set ts=2

:autocmd Filetype html set softtabstop=2
:autocmd Filetype html set sw=2
:autocmd Filetype html set ts=2

"Macro for matching (e.g. do/end)
runtime macros/matchit.vim

"For switching tabs and spaces
set tabstop=2 shiftwidth=2 expandtab

"FZF remapping
map <C-g> :GFiles<CR>
map <C-p> :FZF /<CR>

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" For da buffers
nmap <Left> :bprev<CR>
nmap <Right> :bnext<CR>

" Copy selection and search
vnoremap // y/<C-R>"<CR>
