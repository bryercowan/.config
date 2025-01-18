return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8', -- You can also switch to branch = '0.1.x' if needed
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            defaults = {
                -- Default Telescope configuration options
                vimgrep_arguments = {
                    'rg',
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case'
                },
                prompt_prefix = "> ",
                selection_caret = "> ",
                entry_prefix = "  ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "descending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        mirror = false,
                    },
                    vertical = {
                        mirror = false,
                    },
                },
                file_sorter = require('telescope.sorters').get_fuzzy_file,
                file_ignore_patterns = { "node_modules" },
                generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
                path_display = { "truncate" },
                winblend = 0,
                border = {},
                borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
                color_devicons = true,
                use_less = true,
                set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
                file_previewer = require('telescope.previewers').vim_buffer_cat.new,
                grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
                qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
                -- Developer configurations: Not necessary for general users
                buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
            },
            pickers = {
                -- Custom picker configurations
            },
            extensions = {
                -- Extension configurations
            },
        })

        -- Optional: Load Telescope extensions here
        -- require('telescope').load_extension('fzf') -- Example: fzf extension
    end
}

