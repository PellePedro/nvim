require'nvim-treesitter.configs'.setup {
    treesitter = {
        ensure_installed = "all",
        ignore_install = {"haskell"},
        highlight = {enabled = true},
        playground = {enabled = true},
        rainbow = {enabled = false}
    },
    ensure_installed = {"bash", "go" ,"lua", "python", "javascript", "rust"},
    ignore_install = {"haskell"},
    highlight = {
        enable = true,
    },
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
    indent = {enable = true },
    playground = {
        enable = false,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
    },
    autotag = {enable = true},
    rainbow = {enable = false},
    context_commentstring = {enable = true, config = {javascriptreact = {style_element = '{/*%s*/}'}}},
    textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
		select = {
      		enable = true,
      		-- Automatically jump forward to textobj, similar to targets.vim 
      		lookahead = true,
      		keymaps = {
        		-- You can use the capture groups defined in textobjects.scm
        		["af"] = "@function.outer",
        		["if"] = "@function.inner",
        		["ac"] = "@class.outer",
        		["ic"] = "@class.inner",
      		},
		},
		swap = {
      		enable = true,
      		swap_next = {
        		["<leader>a"] = "@parameter.inner",
      		},
      			swap_previous = {
        		["<leader>A"] = "@parameter.inner",
      		},
    	},
		lsp_interop = {
      		enable = true,
      		peek_definition_code = {
        		["df"] = "@function.outer",
        		["dF"] = "@class.outer",
      		},
		},
    },
}

