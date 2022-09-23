local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" } -- Have packer manage itself

  -- Colorschemes
  use { "lunarvim/darkplus.nvim" }
  use { "nvim-lualine/lualine.nvim" }

  -- utils
  use { "ojroques/vim-oscyank", config = function() vim.g.oscyank_term = 'tmux' end }
  use { "luukvbaal/nnn.nvim" }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  }
  use "ahmedkhalf/project.nvim"
  use { "windwp/nvim-spectre" }

  use { "kdheepak/lazygit.nvim", cmd = "LazyGit", }

  use { "kevinhwang91/nvim-bqf", event = { "BufRead", "BufNew" }, }
  use "lewis6991/gitsigns.nvim"
  use "airblade/vim-rooter"

  use "MattesGroeger/vim-bookmarks"

  use "numToStr/Comment.nvim"
  use "windwp/nvim-autopairs"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-lua/popup.nvim"

  -- Icon:w

  use "kyazdani42/nvim-web-devicons"


  -- Keybinding
  use { 'folke/trouble.nvim' }
  use "folke/which-key.nvim"
  use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }

  -- Syntax/Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"

  -- Completion --------------------------------------------
  -- use "christianchiarulli/nvim-cmp"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  use "zbirenbaum/copilot-cmp"
  use "onsails/lspkind-nvim"
  use { "tzachar/cmp-tabnine", run = "./install.sh" }
  -- Snippet
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  -- Completion --------------------------------------------


  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- lsp
  use {
    "neovim/nvim-lspconfig",
    "folke/lua-dev.nvim",
    "b0o/SchemaStore.nvim",
    { "simrat39/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" },
    "jose-elias-alvarez/null-ls.nvim",
    "jose-elias-alvarez/typescript.nvim",
    "lvimuser/lsp-inlayhints.nvim",
    "SmiteshP/nvim-navic",
    "stevearc/aerial.nvim",
    "RaafatTurki/mason-null-ls.nvim",
  }
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use "ray-x/lsp_signature.nvim"
  -- lsp

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use 'leoluz/nvim-dap-go'

  -- languages
  use { "ray-x/go.nvim" }
  use { 'theHamsta/nvim-dap-virtual-text' }

  -- Indent
  use "lukas-reineke/indent-blankline.nvim"

  -- toggleterm
  use "akinsho/toggleterm.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
