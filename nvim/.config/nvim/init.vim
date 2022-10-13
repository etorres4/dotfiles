" Source other files
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/commands.vim
source ~/.config/nvim/search.vim

" Source vim plugins
set rtp+=/usr/share/vim/vimfiles

" Allow buffers to go to background without needing to write to disk
set hidden

" Disables vi compatibility
set nocompatible

" Disables mouse
set mouse=

" Colors
set termguicolors
"set background=light
"colorscheme breezy

" Set tabs to 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" Set syntax highlighting
syntax enable

" Set filetype detection
if has ("autocmd")
    filetype on
    filetype plugin on
    filetype indent on
endif

" Set line numbers
set number

" Set clipboard to X clipboard buffer
set clipboard+=unnamedplus

" Indentation
set autoindent
set cindent

" Disables cursor-shape termcodes
" Stops the weird q from appearing when changing modes
set guicursor=


" Window Management
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
set wmh=0

" ---------- File finding ----------
" Provide tab completion
set path+=**

" Show all options when tab completing
set wildmenu
