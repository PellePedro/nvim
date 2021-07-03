local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
        prompt_prefix = " ",

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                -- To disable a keymap, put [map] = false
                -- So, to not map "<C-n>", just put
                -- ["<c-x>"] = false,
                ["<esc>"] = actions.close,

                -- Otherwise, just set the mapping to the function that you want it to be.
                -- ["<C-i>"] = actions.select_horizontal,

                -- Add up multiple actions
                ["<CR>"] = actions.select_default + actions.center

                -- You can perform as many actions in a row as you like
                -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                -- ["<C-i>"] = my_cool_custom_action,
            }
        },
        layout_config = {
            horizontal = {
                mirror = false,
                prompt_position = "top",
                width = 0.75,
                preview_cutoff = 120,
            },
            vertical = {
                mirror = false,
                prompt_position = "top",
                width = 0.75,
                preview_cutoff = 120,
            },
        },
    }
}
