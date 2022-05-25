" Search settings

set ignorecase
set smartcase

" Case-insensitive searching on normal mode
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

" Wrap scans at the bottom and top
set wrapscan

" vim: ft=vim
