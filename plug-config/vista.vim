let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']

let g:vista#renderer#enable_icon = 1

let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

nnoremap <space>vo  :Vista coc<CR>
nnoremap <space>vq  :Vista focus<CR>:close<CR>
nnoremap <space>vf  :Vista finder<CR>
nnoremap <space>vs  :Vista show<CR>
nnoremap <space>vv  :Vista focus<CR>
