" Fugitive {{{
"
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |"{{{}}}{{{}}}
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif"{{{}}}

autocmd BufReadPost fugitive://* set bufhidden=delete
"set statusline+=%{exists('g:loaded_fugitive')?%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P:''}


" }}}
