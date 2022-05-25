" Disable ex mode
map Q <Nop>

" Buffer Management
"nnoremap <F5> :buffers<cr>:buffer<Space>

" No arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Spelling
inoremap <C-s> <Esc>:set spell!<cr>a
nnoremap <C-s> :set spell!<cr>

" vim: ft=vim
