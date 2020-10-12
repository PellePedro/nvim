
let g:lua_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★"
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': ""
    \   },
    \ }
let g:lua_tree_bindings = {
      \ "cd": ["<bs>", "cd"],
      \}
let g:lua_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \}

nnoremap <silent><c-n> :LuaTreeToggle<CR>

let g:lua_tree_indent_markers       = 1
let g:lua_tree_git_hl               = 1
let g:lua_tree_auto_close           = 0 " closes the tree when it's the last window
let g:lua_tree_follow               = 1 " show selected file on open
let g:lua_tree_width                 = 30
let g:lua_tree_root_folder_modifier = ':t'
let g:lua_tree_ignore               = ['.DS_Store', 'fugitive:']

highlight LuaTreeSymlink guifg=blue gui=bold,underline
highlight link LuaTreeIndentMarker Comment
highlight LuaTreeRootFolder gui=bold,italic

augroup LuaTreeOverrides
  autocmd!
  autocmd FileType LuaTree setlocal nowrap
augroup END
