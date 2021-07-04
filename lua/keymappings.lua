vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})

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

-- Terminal window navigation
vim.cmd([[
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
]])

vim.cmd([[
  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv
]])

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- QuickFix
vim.api.nvim_set_keymap('n', '<C-j>', ':cnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':cprev<CR>', {noremap = true, silent = true})

vim.cmd([[
  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv
]])



-- Toggle the QuickFix window
vim.api.nvim_set_keymap('', '<C-q>', ':call QuickFixToggle()<CR>', {noremap = true, silent = true})


vim.cmd('vnoremap p "0p')
vim.cmd('vnoremap P "0P')
vim.cmd('nnoremap ; :')
vim.cmd('vnoremap ; :')
vim.cmd('vmap gy :OSCYank<CR>')

-- Misc Mappings

vim.cmd([[


  " Move Between Windows

  tnoremap <Esc> <C-\><C-n>

  vnoremap <silent> jj <ESC>
  inoremap <silent> jj <ESC>

  " Avoid shift to enter command mode
  nnoremap ; :
  vnoremap ; :

  " sourround
  nmap <leader>" ysiw"
  nmap <leader>' ysiw'

  "stay on current word
  nnoremap * *``

  nnoremap j gj
  nnoremap k gk
  nnoremap $ g$
  nnoremap 0 g0

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





