set complete+=kspell
set encoding=utf8
set nowrap
set colorcolumn=80
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
"colorscheme molokai
colorscheme xoria256

autocmd BufRead,BufNewFile Makefile set noexpandtab
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.md set wrap
autocmd BufRead,BufNewFile *.md set colorcolumn=
autocmd BufRead,BufNewFile *.txt setlocal spell

autocmd FileType gitcommit setlocal spell
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=<:>

let g:pymode_rope = 0

let g:go_fmt_command = "goimports"

function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

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

let g:pymode_folding = 0
let g:pymode_lint_ignore = "C0110,E302,E501,W0142,C0103"
let g:vim_markdown_folding_disabled = 1

let g:vim_json_syntax_conceal = 0

inoremap <Nul> <C-x><C-o>

" Magically format tables
"autocmd FileType markdown inoremap \| \|<ESC>:TableFormat<CR>A
"autocmd FileType markdown inoremap \| \|<ESC>:Tabularize /\|<CR>A

au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.babel set filetype=babel
au BufNewFile,BufRead *.qyp set filetype=qyp
au BufNewFile,BufRead *.feature set filetype=cucumber
au BufNewFile,BufRead *.template set filetype=yaml

execute pathogen#infect()
syntax enable
filetype plugin indent on

" Color column marker (at 80)
highlight ColorColumn ctermbg=darkblue
highlight Normal ctermbg=black
