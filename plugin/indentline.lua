local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  print("indent blankline not found")
  return
end

vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "NvimTree",
  "Trouble",
  "text"
}
vim.g.indentLine_enabled = 1
-- vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_char = "▏"
-- vim.g.indent_blankline_char = "▎"

vim.g.indent_blankline_show_trailing_blankline_indent = true
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_use_treesitter = false
-- vim.g.indent_blankline_use_treesitter_scope = 1
vim.g.indent_blankline_show_current_context = true
indent_blankline.setup {
  enabled = true,
  bufname_exclude = { "README.md" },
  buftype_exclude = { "terminal", "nofile" },
  filetype_exclude = {
    "alpha",
    "log",
    "gitcommit",
    "dapui_scopes",
    "dapui_stacks",
    "dapui_watches",
    "dapui_breakpoints",
    "dapui_hover",
    "LuaTree",
    "dbui",
    "UltestSummary",
    "UltestOutput",
    "vimwiki",
    "markdown",
    "json",
    "txt",
    "vista",
    "NvimTree",
    "git",
    "TelescopePrompt",
    "undotree",
    "flutterToolsOutline",
    "org",
    "orgagenda",
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "Outline",
    "Trouble",
    "lspinfo",
    "", -- for all buffers without a file type
  },
  char = "▏",
  -- char_list = { "", "┊", "┆", "¦", "|", "¦", "┆", "┊", "" },
  -- char_highlight_list = {
  --  "IndentBlanklineIndent1",
  --  "IndentBlanklineIndent2",
  --  "IndentBlanklineIndent3",
  --  "IndentBlanklineIndent4",
  --  "IndentBlanklineIndent5",
  --  "IndentBlanklineIndent6",
  --},
  show_end_of_line = true,
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  space_char_blankline = " ",
  use_treesitter = true,
  show_foldtext = false,
  show_current_context = true,
  show_current_context_start = false,
  context_patterns = {
      "class",
      "return",
      "function",
      "method",
      "^if",
      "^do",
      "^switch",
      "^while",
      "jsx_element",
      "^for",
      "^object",
      "^table",
      "block",
      "arguments",
      "if_statement",
      "else_clause",
      "jsx_element",
      "jsx_self_closing_element",
      "try_statement",
      "catch_clause",
      "import_statement",
      "operation_type",
  },
}
