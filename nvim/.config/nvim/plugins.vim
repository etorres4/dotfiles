" vim-plug
call plug#begin('~/.local/share/nvim/plugins')
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'tweekmonster/deoplete-clang2'
Plug 'sbdchd/neoformat'
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdtree'
Plug 'stevearc/vim-arduino'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Configuration for plugins
" ---------- Airline ----------
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme='simple'

" --------- Ale ----------
let g:ale_linters = {
            \ 'python': ['pylint'],
            \ 'vim': ['vint'],
            \ 'cpp': ['clang'],
            \ 'c': ['clang']
            \}

" ---------- Deoplete ----------
let g:deoplete#enable_at_startup = 1

" ---------- Deoplete-Clang ----------
"g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
"g:deoplete#sources#clang#clang_header = '/Library/Developer/CommandLineTools/usr/lib/clang'

" ---------- Fzf ----------
map <C-o> <esc>:FZF<cr>

" Setup for brew-installed fzf
set rtp+=/usr/local/opt/fzf

" Navigate to a tag
function! s:tags_sink(line)
    let parts = split(a:line, '\t\zs')
    let excmd = matchstr(parts[2:], '^.*\ze;"\t')
    execute 'silent e' parts[1][:-2]
    let [magic, &magic] = [&magic, 0]
    execute excmd
    let &magic = magic
endfunction

function! s:tags()
    if empty(tagfiles())
        echohl WarningMsg
        echom 'Preparing tags'
        echohl None
        call system('ctags -R')
    endif

    call fzf#run({
                \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
                \            '| grep -v -a ^!',
                \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
                \ 'down':    '40%',
                \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()
map <C-t> <esc>:Tags<cr>

" Search lines in all open buffers
function! s:line_handler(l)
    let keys = split(a:l, ':\t')
    exec 'buf' keys[0]
    exec keys[1]
    normal! ^zz
endfunction

function! s:buffer_lines()
    let res = []
    for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
        call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
    endfor
    return res
endfunction

command! FZFLines call fzf#run({
            \   'source':  <sid>buffer_lines(),
            \   'sink':    function('<sid>line_handler'),
            \   'options': '--extended --nth=3..',
            \   'down':    '60%'
            \})

" Select buffer
function! s:buflist()
    redir => ls
    silent ls
    redir END
    return split(ls, '\n')
endfunction

function! s:bufopen(e)
    execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <f5> :call fzf#run({
            \   'source':  reverse(<sid>buflist()),
            \   'sink':    function('<sid>bufopen'),
            \   'options': '+m',
            \   'down':    len(<sid>buflist()) + 2
            \ })<CR>

" ---------- NERDTree ----------
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" ---------- Neoformat ----------
" Override python formatter
let g:neoformat_enabled_python=['ruff']

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" For shell formatting
let g:shfmt_opt="-ci -i 4 -sr"
