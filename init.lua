-- General Mappings
require('plugins')
require('nv-globals')
require('nv-utils')
vim.cmd('luafile ~/.config/nvim/nv-settings.lua')
require('keymappings')
require('settings')
require('colorscheme')


-- Plugins
require('nv-compe')
require('nv-colorizer')
require('nv-nvimtree')
require('nv-treesitter')
require('nv-telescope')
require('nv-lightbulb')
require('nv-vim-rooter')
require('nv-gitsigns')
require('nv-diffview')
--require('nv-autopairs')
require('nv-nvim-whichkey')
require('nv-nvim-dap')
require('nv-symbols-outline')


-- LSP
require('lsp')
--require('lsp.clangd')
--require('lsp.lua-ls')
--require('lsp.bash-ls')
require('lsp.go-ls')
require('lsp.python-ls')
require('lsp.rust-ls')
--require('lsp.json-ls')
--require('lsp.yaml-ls')
--require('lsp.terraform-ls')
--require('lsp.vim-ls')
--require('lsp.docker-ls')
--require('lsp.html-ls')
--require('lsp.virtual_text')


-- function _G.osc52(content)
--     local w = assert(io.open("/dev/tty", "w"))
--     assert(w:write(string.format("\x1b]52;c;%s\x1b", require("nv-base64").encode(content))))
--     assert(w:close())
-- end
-- 
-- local clipboard =
--     [[
-- let g:clipboard = {
--     'name': 'myClipboard',
--     'copy': {
--         '+': {lines, regtype -> v:lua.osc52(join(lines, "\n"))}
--     },
--     'paste': {
--         '+': ''
--     }
-- }
-- ]]
-- 
-- vim.api.nvim_exec(string.gsub(clipboard, "[\r\n]", ""), false)
