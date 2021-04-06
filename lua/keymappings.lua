vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':Vifm<CR>', {noremap = true, silent = true})

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- OSC5
vim.api.nvim_set_keymap('n', '<C-c>', ':OSCYank<CR>', {noremap = true, silent = true})

-- Telescope
-- search entered word within project
vim.api.nvim_set_keymap('n', '<Leader>ps', [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]], { noremap = true, silent = true })
-- search by selected word
vim.api.nvim_set_keymap('n', '<Leader>pw', [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>]], { noremap = true, silent = true })
-- buffer list window
vim.api.nvim_set_keymap('n', '<Leader>pb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
-- search by filename in all project files
vim.api.nvim_set_keymap('n', '<Leader>pf', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
-- document symbols
vim.api.nvim_set_keymap('n', '<Leader>1', [[<Cmd>lua require('telescope.builtin.lsp').document_symbols()<CR> ]], { noremap = true, silent = true })
-- workspace symbols
vim.api.nvim_set_keymap('n', '<Leader>2', [[<Cmd>lua require('telescope.builtin.lsp').workspace_symbols()<CR>]], { noremap = true, silent = true })



  --  '\' Mappings
vim.cmd([[
  nmap \\ :only<cr>
  nmap \cd :cd %:p:h<cr>:pwd<cr>
  nmap \w :execute "Rg "."<C-r><C-w>"<cr>
  nmap \q :cclose<CR>
  nnoremap \t :Ttoggle<CR>i
  
  " Count number of matches of word under cursor
  "nmap \n *<C-O>:%s///gn<CR>``
]])



-- General Mappings

vim.cmd([[
  vnoremap <silent> jj <ESC>
  inoremap <silent> jj <ESC>
  
  " Avoid shift to enter command mode
  nnoremap ; :
  vnoremap ; :
  
  " sourround
  nmap <leader>" ysiw"
  nmap <leader>' ysiw'
  
  "nmap ,w ysiw)
  "nmap ,<s-w> ysiW)
  
  nmap .p "0p
  nmap .P "0P
  
  "stay on current word
  nnoremap * *``
  
  nnoremap j gj
  nnoremap k gk
  nnoremap $ g$
  nnoremap 0 g0
  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '<-2<CR>gv=gv
  
  " Center Scrolling
  noremap <C-d> <C-d>zz
  noremap <C-u> <C-u>zz
  noremap <C-f> <C-f>zz
  noremap <C-b> <C-b>zz
  
  noremap zz zzzr
  nnoremap <CR> :nohl<CR>
  
  " prevent entering ex mode accidentally
  nnoremap Q <Nop>
]])
