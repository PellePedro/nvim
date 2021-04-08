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
  [','] = { ':w<CR>', 'Save' },
  [';'] = { ':Telescope commands<CR>', 'Commands' },
  ['r'] = { [[<cmd>lua vim.lsp.buf.rename()<CR>]] , 'LSP Rename'},
  ['K'] = { [[<cmd>lua vim.lsp.buf.hover()<CR>]] , 'LSP Doc'},
  ['y'] = { ':OSCYank <CR>', 'OSCYank' },
  ['1'] = {
        [[<Cmd>lua require('telescope.builtin.lsp').document_symbols()<CR>]],
        'Document Symbols'
  },
  ['2'] = {
        [[<Cmd>lua require('telescope.builtin.lsp').workspace_symbols()<CR>]],
        'Workspace Symbols'
  },

  ['d'] = {
    ['name'] = '+debug',
    ['d'] = {
		[[<Cmd>lua require('dap').continue()<CR>]],
        'Start Debugging'
    },
    ['b'] = {
		[[<Cmd>lua require('dap').toggle_breakpoint()<CR>]],
        'Toggle Breakpoint'
    },
    ['r'] = {
		[[<Cmd>:lua require'dap'.repl.toggle({height=15})<CR>]],
        'Open Repl'
    },
    ['s'] = {
		[[<Cmd>lua require('dap.ui.variables').scopes()<CR>]],
        'Show Variables'
    },
    ['1'] = {
		[[<Cmd>lua require'dap'.step_over()<CR>]],
        'Step Over'
    },
    ['2'] = {
		[[<Cmd>lua require'dap'.step_into()<CR>]],
        'Step Into'
    },
    ['3'] = {
		[[<Cmd>lua require'dap'.step_out()]],
        'Step Out'
    },
    ['3'] = {
		[[<Cmd>lua require'dap'.step_out()]],
        'Step Out'
    },
    ['e'] = {
		[[<Cmd>lua require('lsp-diagnostics').errors_to_quickfix()]],
        'LSP Errors'
    },
    ['w'] = {
		[[<Cmd>lua require('lsp-diagnostics').warnings_to_quickfix()]],
        'LSP Warnings'
    },
  },

  ['c'] = {
    ['name'] = '+LSP',
    ['a'] = { ':Lspsaga code_action<CR>', 'Code Action' },
    ['d'] = { [[<cmd>lua vim.lsp.buf.definition()<CR>]],  'Goto Definition'},
    ['D'] = { [[<cmd>lua vim.lsp.buf.declaration()<CR>]], 'Goto Declaration'},
    ['r'] = { [[<cmd>lua vim.lsp.buf.references()<CR>]],  'Goto References'},
    ['i'] = { [[<cmd>lua vim.lsp.buf.implementation()<CR>]], 'Goto Implementation'},
    ['n'] = { ':Lspsaga diagnostic_jump_next<CR>', 'Next Diagnostic'},
    ['p'] = { ':Lspsaga diagnostic_jump_prev<CR>', 'Previous Diagnostica'}
  },
  ['e'] = {
    ['name'] = '+Navigate',
    ['e'] = { ':Vifm<CR>', 'Vifm' }
  },

  -- NOTE: f is for find
  ['f'] = {
    ['name'] = '+Find',
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
  ['g'] = {
    ['name'] = '+Git',
    ['s'] = { ':Gstatus<CR>', 'Git Status' }
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
