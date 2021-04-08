--[[
O is the global options object

Formatters and linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- general
O.auto_complete = true
O.colorscheme = 'nvcode'
O.auto_close_tree = 0
O.wrap_lines = false

O.treesitter.ensure_installed = "all"
O.treesitter.ignore_install = {"haskell"}
O.treesitter.highlight.enabled = true
O.treesitter.playground.enabled = true
O.treesitter.rainbow.enabled = false


O.clang.diagnostics.virtual_text = false
O.clang.diagnostics.signs = false
O.clang.diagnostics.underline = false

-- python
-- add things like O.python.formatter.yapf.exec_path
-- add things like O.python.linter.flake8.exec_path
-- add things like O.python.formatter.isort.exec_path
O.python.formatter = 'yapf'
-- O.python.linter = 'flake8'
O.python.isort = true
O.python.autoformat = true
O.python.diagnostics.virtual_text = true
O.python.diagnostics.signs = true
O.python.diagnostics.underline = true

-- lua
-- TODO look into stylua
O.lua.formatter = 'lua-format'
-- O.lua.formatter = 'lua-format'
O.lua.autoformat = false

-- javascript
O.tsserver.formatter = 'prettier'
O.tsserver.linter = nil
O.tsserver.autoformat = true

-- json
O.json.autoformat = true

-- custom autocommand field


vim.g.mapleader = '\\'
vim.api.nvim_command [[
function! DeleteTrailingWS()
exe 'normal mz'
%s/\s\+$//ge
exe 'normal `z'
endfunction
]]

vim.cmd('set termguicolors')
vim.cmd('set matchpairs=(:),{:},[:],<:>,`:`')
vim.cmd('set listchars=tab:▶·,eol:¬,trail:⋅,extends:❯,precedes:❮')
vim.cmd('set showbreak=↪')
vim.cmd('set list')

vim.cmd('au Filetype go setlocal tabstop=4 shiftwidth=4 noexpandtab softtabstop=4 colorcolumn=140')
vim.cmd('au Filetype go,rst setlocal foldmethod=indent')
vim.cmd('au Filetype go,rst setlocal foldlevel=1')
vim.cmd('au Filetype go setlocal list')
vim.cmd('au! TextChanged,TextChangedI *.go,*.rst,*.sh,*.java silent write')

vim.api.nvim_exec([[
  autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' |   exe "normal! g`\"" | endif
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd TermOpen * if &buftype ==# 'terminal' | startinsert | endif
  autocmd BufLeave term://* stopinsert
  autocmd TermClose term://* if (expand('<afile>') !~ "fzf") | call nvim_input('<CR>') | endif
]], false)
