" Autosave
autocmd TextChanged,TextChangedI <buffer> silent write

" Indentation
au BufNewFile,BufRead *.go  setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
au BufNewFile,BufRead *.sh  setlocal   et ts=4 sw=4 sts=4
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md  setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.vim setlocal   et sw=2 ts=2
au BufNewFile,BufRead *.rst setlocal      sw-4 ts=4 sts=4
au FileType json            setlocal   et sw=2 ts=2

" Folding
au Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
au FileType go,rst setlocal foldmethod=indent
au FileType go,rst setlocal foldlevel=1
au FileType go setlocal nolist
"au! TextChanged,TextChangedI *.go,*.rst,*.sh,*.java <buffer> silent write

" rst
au BufNewFile,BufRead *.rst set textwidth=75
au BufNewFile,BufRead *.rst syntax spell toplevel
au BufNewFile,BufRead *.rst setlocal spell

"" Remove trailing whitespaces
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

au BufWrite *.go :call DeleteTrailingWS()
au BufWrite *.rst :call DeleteTrailingWS()
"
" Make sure Vim returns to the same line when you reopen a file.
"
au BufReadPost *
      \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif


"au FocusGained,WinEnter,BufEnter,FileChangedShellPost * checktime | SignifyRefresh
"
""
"put quickfix window always to the bottom
au FileType qf wincmd J
augroup quickfix
    au!
    au FileType qf setlocal wrap
    augroup END

au QuickFixCmdPost * botright copen 8 | wincmd p


