" vim:fdm=marker

inoremap <silent><expr> <c-x><c-o> coc#refresh()

let g:coc_enable_locationlist = 0

runtime coc-bookmark.vim
runtime coc-git.vim
runtime coc-lists.vim
runtime coc-snippets.vim

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <Leader>d :CocList diagnostics<CR>
inoremap <silent><expr> <leader>r coc#refresh()
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> <leader>rr <Plug>(coc-refactor)
nnoremap <silent> <leader>rn <Plug>(coc-rename)
nnoremap <silent> <a-g> :echo b:coc_current_function<Cr>

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

" Fix autofix problem of current line
nmap <silent> <leader>q <Plug>(coc-fix-current)
xmap <silent> <leader>a <plug>(coc-codeaction-selected)

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
endfunc

command! InstallCoc :call s:install_coc_extensions()


