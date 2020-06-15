" Dynamically switch color scheme and have things respect it
function SwitchColorScheme(name)
  let g:VIM_COLOR_SCHEME = a:name
  call ColorScheme()
  "call lightline#init()
  "call lightline#colorscheme()
  "call lightline#update()
endfunction

function! ColorScheme()

  if g:VIM_COLOR_SCHEME ==# 'nord'
    set background=dark
    let g:nord_underline = 1
    let g:nord_italic_comments = 1
    let g:nord_italic = 1
    let g:nord_cursor_line_number_background = 1
    silent! colorscheme nord
    let g:airline_theme='nord'
    "let g:lightline = {}
    "let g:lightline.colorscheme = 'nord'
  endif

  if  g:VIM_COLOR_SCHEME ==# 'gruvbox'
    set background=dark
    silent! colorscheme gruvbox-material
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline_theme='deus'
    "let g:lightline = {}
    "let g:lightline.colorscheme = 'gruvbox_material'
  endif
endfunction

" The Defaults

"========================= Theme ================= {{{




"}}}

