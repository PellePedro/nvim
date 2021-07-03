-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then vim.cmd("packadd " .. plugin) end
    return ok, err, code
end

local my = function(file) require(file) end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

	use 'sirver/ultisnips'
	use 'honza/vim-snippets'
    -- My Plugins ====================================
    -- Theme
    use 'vim-airline/vim-airline'
    use {
       'vim-airline/vim-airline-themes',
       config = function()
          vim.g["airline_powerline_fonts"] = 1
          vim.g["airline#extensions#tabline#enabled"] = 1
          vim.g["airline#extensions#tabline#buffer_nr_show"] = 1
          vim.g["airline_theme"] = 'deus'
          vim.g["&t_8f"] = "<Esc>[38;2;%lu;%lu;%lum]"
          vim.g["&t_8b"] = "<Esc>[48;2;%lu;%lu;%lum]"
      end
    }
    -- use 'nvim-telescope/telescope-vimspector.nvim'
    use 'vifm/vifm.vim'
    use 'justinmk/vim-dirvish'
    use { 'ntpeters/vim-better-whitespace',
        config = function()
            vim.g["better_whitespace_enabled"] = 1
        end
    }
    use 'jiangmiao/auto-pairs'
    use { 'AckslD/nvim-whichkey-setup.lua', 
        requires = {'liuchengxu/vim-which-key'},
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'kosayoda/nvim-lightbulb'
    use 'mfussenegger/nvim-jdtls'
    use 'kabouzeid/nvim-lspinstall'

    use 'ojroques/vim-oscyank'

    ----  Debugging
    use 'mfussenegger/nvim-dap'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'Pocco81/DAPInstall.nvim'
    --    config = function()
    --        local dap_install = require("dap-install")
    --        dap_install.setup()
    --        dap_install.config("go_delve_dbg", {})
    --    end
    --}
	use 'janko/vim-test'

    -- Autocomplete
    use 'hrsh7th/nvim-compe'
    use 'mattn/emmet-vim'
    use 'hrsh7th/vim-vsnip'
    use "rafamadriz/friendly-snippets"
    use 'ChristianChiarulli/html-snippets'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'p00f/nvim-ts-rainbow'
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use 'nvim-treesitter/playground'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'windwp/nvim-ts-autotag'

    -- Icons
     use 'kyazdani42/nvim-web-devicons'
     use 'ryanoasis/vim-devicons'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Color
    use 'christianchiarulli/nvcode-color-schemes.vim'
    use 'norcalli/nvim-colorizer.lua'
    use 'sheerun/vim-polyglot'

    -- Git
    -- use 'TimUntersberger/neogit'
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use 'f-person/git-blame.nvim'
    use 'tpope/vim-fugitive'
    use 'junegunn/gv.vim'
    use 'TimUntersberger/neogit'
    use 'sindrets/diffview.nvim'

    -- Easily Create Gists
    use 'mattn/vim-gist'
    use 'mattn/webapi-vim'

    use 'airblade/vim-rooter'
    use 'windwp/nvim-autopairs'
    use 'mbbill/undotree'

end)
