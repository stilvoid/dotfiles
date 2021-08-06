set complete+=kspell
set encoding=utf8
set nowrap
set colorcolumn=120
set expandtab
set guioptions-=T
set guioptions-=r
set lazyredraw
set incsearch
set showmatch
set hlsearch
set ruler
set number
set smartindent
set smarttab
set spelllang=en_gb
set sts=4
set sw=4
set ts=4
set tw=0
set t_Co=256
set autoread
set so=3

set background=dark

au BufNewFile,BufFilePre,BufRead *.tmpl set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.txt set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.template set filetype=yaml
au BufNewFile,BufFilePre,BufRead *.at set filetype=at

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=<:>
autocmd FileType Makefile set noexpandtab
autocmd FileType markdown setlocal spell wrap linebreak nonumber
autocmd FileType gitcommit setlocal spell

"autocmd BufWritePost *.template silent !rain fmt -w %
"2>/dev/null

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

let g:vim_json_syntax_conceal = 0

au BufEnter * call MyLastWindow()
function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction

"inoremap <Nul> <C-x><C-o>

syntax enable
filetype plugin indent on
