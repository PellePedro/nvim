local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)


-- List
vim.cmd('set termguicolors')
vim.cmd('set matchpairs=(:),{:},[:],<:>,`:`')
vim.cmd('set listchars=tab:▶·,eol:¬,trail:⋅,extends:❯,precedes:❮')
vim.cmd('set showbreak=↪')
vim.cmd('set nolist')


-- g mapping
vim.api.nvim_set_keymap('v', 'gy', ':OSCYank<cr>', { silent = false })

-- Tab switch buffer
vim.api.nvim_set_keymap("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })

-- Window Movement
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })


vim.api.nvim_exec([[
  autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif
]], false)

vim.api.nvim_set_keymap('n', '\\a', [[<cmd>lua vim.lsp.buf.code_action()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\1', [[<cmd>:AerialToggle<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\2', [[<cmd>:Telescope buffers<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\e', [[<cmd>:Neotree reveal toggle<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\t', [[<cmd>:TroubleToggle<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\r', [[<cmd>lua vim.lsp.buf.rename()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\s', [[<cmd>:BookmarksShowAll<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '\\y', [[<cmd>:OSCYank<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\t', [[<cmd>:TroubleToggle<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '\\a', [[<cmd>lua vim.lsp.buf.code_action()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\b', [[<cmd>:GoBreakToggle<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\d', [[<cmd>:GoDebug<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\x', [[<cmd>:GoDbgStop<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '\\a', [[<C-^>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\l', [[<cmd>:set list!<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\w',
  [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>]],
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\s',
  [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]],
  { noremap = true, silent = true })

vim.cmd('nnoremap <silent> <leader>y "+y')
vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
vim.cmd("nnoremap <silent> gR <cmd>lua vim.lsp.buf.references()<CR>")
vim.cmd("nnoremap <silent> gr <cmd>Lspsaga lsp_finder<CR>")
vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")
vim.cmd(
  "nnoremap <silent> gl <cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = 'single' })<CR>"
)


vim.api.nvim_exec([[
  autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif
]], false)
