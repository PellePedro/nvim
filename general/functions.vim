" vim:fdm=marker
"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! SendOSCClipboard(lines, regtype)
   call SendViaOSC52(join(a:lines, "\n"))
endfunction

let g:clipboard = {
      \   'name': 'TMUX',
      \   'copy': {
      \      '+': function('SendOSCClipboard'),
      \      '*': 'tmux load-buffer -',
      \    },
      \   'paste': {
      \      '+': 'tmux save-buffer -',
      \      '*': 'tmux save-buffer -',
      \   },
      \   'cache_enabled': 1,
      \ }

