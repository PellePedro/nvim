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
  ['K'] = { [[<cmd>lua vim.lsp.buf.hover()<CR>]] , 'LSP Doc'},
  ['e'] = { ':Vifm<CR>', 'Vifm' },
  ['n'] = { ':NvimTreeToggle<CR>', 'NvimTree' },
  ['t'] = { ':terminal<CR>', 'Open Terminal' },
  ['y'] = { ':OSCYank<CR>', 'OSCYank' },
  ['r'] = { [[<cmd>lua vim.lsp.buf.rename()<CR>]] , 'LSP Rename'},
  ['1'] = {
        [[<Cmd>lua require('telescope.builtin.lsp').document_symbols()<CR>]],
        'Document Symbols'
  },
  ['2'] = {
        [[<Cmd>lua require('telescope.builtin.lsp').workspace_symbols()<CR>]],
        'Workspace Symbols'
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
  ['d'] = {
    ['name'] = "+Debug",
	['b'] = { [[<cmd>:Telescope dap list_breakpoints<CR>]], 'Telescope List Breakpoints'},
	['b'] = { [[<cmd>:Telescope dap commands<CR>]], 'Telescope Dap Commands'},
	['f'] = { [[<cmd>:Telescope dap frames<CR>]], 'Telescope Dap Frames'},
	['h'] = { [[<cmd>lua require('dap').toggle_breakpoint()<CR>]], 'Toggle Break Point'},
    ['c'] = { [[<Cmd>:lua require'dap'.continue()<CR>]], 'Debug Continue'},
    ['e'] = { [[<Cmd>:lua require'dap'.set_exception_breakpoints({"all"})<CR>]], 'Debug Continue'},
	['?'] = { [[<cmd>:lua require'dap.ui.variables'.scopes()<CR>]], 'Variable Scopes'},
	['i'] = { [[<cmd>:lua require'dap.ui.variables'.hover(function () return vim.fn.expand("<cexpr>") end)<CR>]], 'Variable Scopes'},
	['j'] = { [[<cmd>]:lua require'dap'.down()<CR>]], 'Jump Down'},
	['k'] = { [[<cmd>]:lua require'dap'.up()<CR>]], 'Jump Up'},
	['r'] = { [[<cmd>:lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l]], 'Open Repl'},
	['s'] = {
    	['s'] = { [[<Cmd>:lua require'dap'.step_over()<CR>]],'Debug Step Over'},
    	['i'] = { [[<Cmd>:lua require'dap'.step_in()<CR>]],  'Debug Step In'},
    	['o'] = { [[<Cmd>:lua require'dap'.step_out()<CR>]], 'Debug Step Out'},
	},
	['q'] = { [[<cmd>:lua require("dapui").toggle()<CR>]], 'DAP UI'},
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
    ['s'] = { ':Gstatus<CR>', 'Git Status' },
    ['g'] = { ':Neogit<CR>', 'Neogit' },
    ['d'] = { ':DiffviewOpen<CR>', 'Diffview' },
    ['p'] = { ':Neogit push<CR>', 'push' },
  },

}

wk.register_keymap('leader', leader_key_maps, { silent = false })
