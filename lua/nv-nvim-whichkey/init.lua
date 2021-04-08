local wk = require('whichkey_setup')

vim.cmd [[set timeoutlen=500]]

local opts = { noremap = true, silent = true }

-- NOTE: Map leader to which_key

vim.api.nvim_set_keymap('n', '<leader>', [[:silent <c-u> :silent WhichKey '<Space>'<CR> ]], opts)
vim.api.nvim_set_keymap('v', '<leader>', [[:silent <c-u> :silent WhichKeyVisual '<Space>'<CR> ]],
    opts)

-- NOTE: options for which key
-- let g:which_key_sep = '→'
vim.g.which_key_use_floating_win = 0
vim.g.which_key_disable_default_offset = 1
vim.g.which_key_hspace = 10
vim.g.which_key_centered = 0

vim.api.nvim_exec([[
      " highlights
      highlight default link WhichKey          Operator
      highlight default link WhichKeySeperator DiffAdded
      highlight default link WhichKeyGroup     Identifier
      highlight default link WhichKeyDesc      Function

      " Hide status line
      autocmd! FileType which_key
      autocmd  FileType which_key set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
      ]], true)

-- NOTE: leader key mappings
local leader_key_maps = {
  -- NOTE: direct mappings
  [','] = { ':w<CR>', 'save' },
  ['.'] = { ':e $MYVIMRC<CR>', 'open-init' },
  [';'] = { ':Telescope commands<CR>', 'commands' },
  ['y'] = { ':OSCYank <CR>', 'OSCYank' },
  ['1'] = {
        [[<Cmd>lua require('telescope.builtin.lsp').document_symbols()<CR>]],
        'Document Symbols'
  },
  ['2'] = {
        [[<Cmd>lua require('telescope.builtin.lsp').workspace_symbols()<CR>]],
        'Workspace Symbols'
  },

  -- NOTE: a is for actions
  ['a'] = {
    ['name'] = '+actions',
    ['c'] = { ':Vifm', 'colorizer' }
  },

  ['e'] = {
    ['name'] = '+navigate',
    ['e'] = { ':Vifm<CR>', 'Vivm' }
  },

  -- NOTE: f is for find
  ['f'] = {
    ['name'] = '+find',
    ['b'] = { [[<cmd>lua require('telescope.builtin').buffers()<CR>]], 'Buffers' },
    ['c'] = {
        [[<cmd>lua require('telescope.builtin').find_files{cwd='~/.config/nvim'}<CR>]],
        'Find Configuration'
    },
    ['f'] = {
        [[<cmd>lua require('telescope.builtin').find_files()<CR>]],
        'Find Files'
    },
    ['w'] = {
        [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>]],
        'Search word under cursor'
    },
    ['s'] = {
        [[<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]],
        'Grep For >'
    }

  },
}

-- local local_leader_plug_keymaps = {
--  ['s'] = {
--    ['name'] = '+sideways',
--  }
-- }

--local leader_plug_keymaps = {
--  ['c'] = {},
--}

--wk.register_keymap('localleader', local_leader_key_maps, { silent = true })
--wk.register_keymap('localleader', local_leader_plug_keymaps, { noremap = false })
wk.register_keymap('leader', leader_key_maps, { silent = false })
--wk.register_keymap('leader', leader_plug_keymaps, { noremap = false })
