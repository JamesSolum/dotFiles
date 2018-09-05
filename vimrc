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
Plugin 'tmhedberg/SimpylFold' " Fun folds
Plugin 'vim-scripts/indentpython.vim' " For automatic indentation in python
Plugin 'scrooloose/nerdtree' " Side menu for files
Plugin 'vim-airline/vim-airline' " the vim bar at the bottom
Plugin 'scrooloose/nerdcommenter' " For commenting? ??? research this
Plugin 'mileszs/ack.vim' " For searching?
Plugin 'vim-scripts/file-line' " lets you open a file at a specific line
Plugin 'qpkorr/vim-bufkill' " Remove buffers w/out removing splits
Plugin 'junegunn/fzf' " Fuzzy finder
Plugin 'junegunn/fzf.vim' "Fuzzy finder vim --??? REsearch this
Plugin 'yuttie/comfortable-motion.vim' "for smooth scrolling
Plugin 'tpope/vim-fugitive' " git integration
Plugin 'Valloric/YouCompleteMe' " auto completion  Installation guide: https://valloric.github.io/YouCompleteMe/#general-usage
Plugin 'vim-syntastic/syntastic' " syntax checker
Plugin 'xolox/vim-session' " vim sessions https://github.com/xolox/vim-session
Plugin 'xolox/vim-misc' " a dependency for vim-sessions
Plugin 'Yggdroot/indentLine' " for indent lines

" Vim Themes
Plugin 'ayu-theme/ayu-vim'
Plugin 'tomasr/molokai'
Plugin 'nightsense/seabird'
Plugin 'vim-airline/vim-airline-themes'

" Ruby / Rails
Plugin 'ngmy/vim-rubocop' " Ruby linter
Plugin 'tpope/vim-rails' " Ruby Shortcuts
Plugin 'lucapette/vim-ruby-doc' " Ruby Doc
Plugin 'tpope/vim-rbenv' "Ruby environment manager
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

"Nerd Tree
map <C-n> :NERDTreeToggle<CR> 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Basics
syntax on  
set smartindent
inoremap <Nul> <C-n>
set mouse=a
set number
set background=dark
set so=7

"For Powerline to appear in single windows
set laststatus=2
set backspace=indent,eol,start

" Colors && Themeing!
set termguicolors
let ayucolor="dark"
colorscheme molokai
let g:airline_theme='ayu'

" Ruby Formatting
:autocmd Filetype ruby set softtabstop=2
:autocmd Filetype ruby set expandtab
:autocmd Filetype ruby set sw=2
:autocmd Filetype ruby set ts=2

" Html Formatting
:autocmd Filetype html set softtabstop=2
:autocmd Filetype html set sw=2
:autocmd Filetype html set ts=2

" Python Formatting
au BufNewFile,BufRead *.py
            \set tabstop=4
            \set softtabstop=4
            \set shiftwidth=4
            \set textwidth=79
            \set expandtab
            \set autoindent
            \set fileformat=unix

"Macro for matching (e.g. do/end)
runtime macros/matchit.vim

"For switching tabs and spaces
set tabstop=2 shiftwidth=2 expandtab

"FZF remapping: 
"    ctrl-g will let you search your current git repo files
"    ctrl-p will let you search all your files
map <C-g> :GFiles<CR> 
map <C-p> :FZF /<CR>

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" For buffers:
"   left and right arrows for navigating buffers
nmap <Left> :bprev<CR> 
nmap <Right> :bnext<CR>
set hidden " so we can switch buffers w/out needing to save them

" Scrolling
let g:comfortable_motion_friction = 640
let g:comfortable_motion_air_drag = 16

let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 8  " Feel free to increase/decrease this value.
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:NERDCustomDelimiters = { 'eruby.yaml': { 'left': '#'} } " how to comment on eruby.yaml files

