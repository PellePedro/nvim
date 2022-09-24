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
keymap('v', 'gy', ':OSCYank<cr>', { silent = false })

-- Tab switch buffer
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

-- Window Movement
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


vim.api.nvim_exec([[
  autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif
]], false)

keymap('n', '\\a', [[<cmd>lua vim.lsp.buf.code_action()<CR>]],opts)
keymap('n', '\\1', [[<cmd>:AerialToggle<CR>]], opts)
keymap('n', '\\2', [[<cmd>:Telescope buffers<CR>]], opts)
keymap('n', '\\e', [[<cmd>:Neotree reveal toggle<CR>]], opts)
keymap('n', '\\t', [[<cmd>:TroubleToggle<CR>]], opts)
keymap('n', '\\r', [[<cmd>lua vim.lsp.buf.rename()<CR>]], opts)
keymap('v', '\\y', [[<cmd>:OSCYank<CR>]], opts)
keymap('n', '\\t', [[<cmd>:TroubleToggle<CR>]], opts)

keymap('n', '\\a', [[<cmd>lua vim.lsp.buf.code_action()<CR>]], opts)
keymap('n', '\\b', [[<cmd>:GoBreakToggle<CR>]], opts)
keymap('n', '\\d', [[<cmd>:GoDebug<CR>]], opts)
keymap('n', '\\x', [[<cmd>:GoDbgStop<CR>]], opts)
-- vim.api.nvim_set_keymap('n', '\\a', [[<C-^>]], { noremap = true, silent = true })
keymap('n', '\\l', [[<cmd>:set list!<CR>]], opts)
keymap('n', '\\w',
  [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>]],
  opts)
keymap('n', '\\s',
  [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]],
  opts)

vim.api.nvim_exec([[
  autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif
]], false)
