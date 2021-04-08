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


-- Misc Mappings

vim.cmd([[

  :tnoremap <Esc> <C-\><C-n>

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





