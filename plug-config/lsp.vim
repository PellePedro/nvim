" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing extra messages when using completion
set shortmess+=

inoremap <C-c> <esc>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" ========= NVIM-LSP ================
" https://neovim.io/doc/user/lsp.html

command! -bar -nargs=0 RestartLSP :lua vim.lsp.stop_client(vim.lsp.get_active_clients()); vim.cmd("edit")

lua <<EOF
-- https://github.com/lewis6991/dotfiles/blob/master/nvim/lua/lsp.lua

local nvim_lsp   = require 'lspconfig'
local completion = require 'completion'
local configs    = require 'lspconfig/configs'

vim.lsp.set_log_level(0)

-- Empty diagnostic handler.
local none_diagnostic_handler = function() end

-- Diagnostics symbols for display in the sign column.
vim.api.nvim_command('sign define LspDiagnosticsSignError text=')
vim.api.nvim_command('sign define LspDiagnosticsSignWarning text=')
vim.api.nvim_command('sign define LspDiagnosticsSignInformation text=✦')
vim.api.nvim_command('sign define LspDiagnosticsSignHint text=')

-- Options for completion-nvim plugin.
vim.g.completion_enable_auto_hover      = 0
vim.g.completion_enable_auto_paren      = 0
vim.g.completion_enable_auto_signature  = 0
vim.g.completion_matching_strategy_list = {'exact'}
vim.g.completion_menu_length            = 0
vim.g.completion_sorting                = 'alphabet'
vim.g.completion_timer_cycle            = 200
vim.g.completion_trigger_keyword_length = 3

-- On attach function.
local lsp_on_attach = function(client)
  completion.on_attach(client)

  -- Mappings/
  local opts = {noremap = true, silent = true}
  vim.fn.nvim_buf_set_keymap(0, 'n', 'ga','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.fn.nvim_buf_set_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.fn.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.fn.nvim_buf_set_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.fn.nvim_buf_set_keymap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.fn.nvim_buf_set_keymap(0, 'n', '\r','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.fn.nvim_buf_set_keymap(0, 'i', 'gH', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.fn.nvim_buf_set_keymap(0, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.fn.nvim_buf_set_keymap(0, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

  -- Enable LSP omnifunc.
  vim.api.nvim_command('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

  -- Indicate that LSP is ready.
  print('Language server is ready')
end

local executable = function(x)
  return vim.fn.executable(x) ~= 0
end

if executable('gopls') then
  nvim_lsp.gopls.setup  { on_attach = lsp_on_attach }
end

if executable('java') then
  nvim_lsp.jdtls.setup  { on_attach = lsp_on_attach }
end

nvim_lsp.rust_analyzer.setup { on_attach = lsp_on_attach }
nvim_lsp.bashls.setup { on_attach = completion.on_attach }
nvim_lsp.pyls_ms.setup  { on_attach = lsp_on_attach }

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      prefix = '',
    },
    signs = true,
    update_in_insert = true,
  }
)

local ok, lsputil = pcall(require, "lsputil.codeAction")
if ok then
  vim.lsp.handlers["textDocument/codeAction"] = lsputil.code_action_handler
  vim.lsp.handlers["textDocument/references"] = lsputil.references_handler
  vim.lsp.handlers["textDocument/definition"] = lsputil.definition_handler
  vim.lsp.handlers["textDocument/declaration"] = lsputil.declaration_handler
  vim.lsp.handlers["textDocument/typeDefinition"] = lsputil.typeDefinition_handler
  vim.lsp.handlers["textDocument/implementation"] = lsputil.implementation_handler
  vim.lsp.handlers["textDocument/documentSymbol"] = lsputil.document_handler
  vim.lsp.handlers["workspace/symbol"] = lsputil.workspace_handler
end
EOF

