let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1

let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

let g:vista_echo_cursor_strategy='both'
let g:vista_close_on_jump=0
let g:vista_default_executive='nvim_lsp'
let g:vista_log_file = stdpath('cache').'/vista.log'

let g:vista_executive_for = {
    \ 'go': 'vim_lsp',
    \ 'markdown': 'toc',
    \ }
let g:vista_highlight_whole_line=1

augroup lsp
  au!
  au FileType go,rst,sh,java nmap \f  :Vista finder nvim_lsp<CR>
  au FileType go,rst,sh,java nmap \t  :Vista nvim_lsp<CR>
  au FileType go,rst,sh,java nmap \q  :Vista!<CR>
augroup END
