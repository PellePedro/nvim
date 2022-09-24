local ok, _ = pcall(require, "go")
if not ok then
  return
end

require('go').setup ({
  verbose = false, -- output loginf in messages
  dap_debug = true, -- set to true to enable dap
  dap_debug_keymap = true, -- set keymaps for debugger
  dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
  dap_debug_vt = true, -- set to true to enable dap virtual text
  icons = false,

  -- TODO: Test these out.
  -- goimport = "gofumports", -- goimport command
  -- gofmt = "gofumpt", --gofmt cmd,
  -- max_line_len = 120, -- max line length in goline format
  -- tag_transform = false, -- tag_transfer  check gomodifytags for details
  -- test_template = "", -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
  -- test_template_dir = "", -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
  -- comment_placeholder = "", -- comment_placeholder your cool placeholder e.g. ﳑ       

  -- Disable everything for LSP
  lsp_cfg = false, -- true: apply go.nvim non-default gopls setup
  lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = false, -- if a on_attach function provided:  attach on_attach function to gopls
  gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile", "/var/log/gopls.log" }
})

-- More convenience
vim.api.nvim_exec(
[[
		augroup Golang
		autocmd! Golang
		autocmd FileType go nmap <buffer> <silent> <leader>tt :GoTest %:p:h<CR>
		autocmd FileType go nmap <buffer> <silent> <leader>tf :GoTestFunc<CR>
		autocmd FileType go nmap <buffer> <silent> <leader>dg :GoDebug<CR>
		autocmd FileType go nmap <buffer> <silent> <leader>ds :GoDbgStop<CR>
		autocmd FileType go nmap <buffer> <silent> <leader>dt :GoDebug test<CR>
		autocmd FileType go nmap <buffer> <silent> <leader>bp :GoBreakToggle<CR>
	augroup end
	]],
	false
)
