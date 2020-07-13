" vim:fdm=marker

inoremap <silent><expr> <c-x><c-o> coc#refresh()

let g:coc_enable_locationlist = 0

runtime coc-bookmark.vim
runtime coc-git.vim
runtime coc-lists.vim
runtime coc-snippets.vim


" command! -nargs=0 Format :call CocAction('format')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

set formatexpr=CocAction('formatSelected')

inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

function! s:install_coc_extensions()
  CocInstall coc-diagnostic
  CocInstall coc-rls
  CocInstall coc-go
  CocInstall coc-json
  CocInstall coc-pairs
  CocInstall coc-python
  CocInstall coc-sh
  CocInstall coc-snippets
  CocInstall coc-yaml
  CocInstall coc-java
  CocInstall coc-java-debug
endfunc

command! InstallCoc :call s:install_coc_extensions()


