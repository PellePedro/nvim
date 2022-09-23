local ok, null_ls = pcall(require, "null-ls")
local ok1, mason_null_ls = pcall(require, "mason-null-ls")
if not ok or not ok1 then
  return
end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
mason_null_ls.setup {}

null_ls.setup {
  sources = {
  --    null_ls.builtins.diagnostics.codespell,
  --    null_ls.builtins.diagnostics.gitlint,
  --    null_ls.builtins.diagnostics.misspell,
  --    null_ls.builtins.diagnostics.shellcheck,
  --    null_ls.builtins.diagnostics.yamllint,
  --    null_ls.builtins.formatting.jq,
  --    null_ls.builtins.formatting.markdownlint,
  --    null_ls.builtins.formatting.prettierd,
  --    null_ls.builtins.formatting.shellharden,
  --    null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.goimports,
  null_ls.builtins.formatting.gofumpt,
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = 0,
        callback = function() vim.lsp.buf.formatting_seq_sync() end
      })
    end
  end,
}
