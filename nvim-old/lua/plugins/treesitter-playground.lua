return {
    'nvim-treesitter/playground',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },  -- Ensure Treesitter is loaded first
    cmd = "TSPlaygroundToggle",  -- Lazy-load the plugin when the command is used
    config = function()
        require('nvim-treesitter.configs').setup({
            playground = {
                enable = true,  -- Enable the playground extension
                updatetime = 25,  -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false,  -- Whether the query persists across vim sessions
                keybindings = {
                    toggle_query_editor = 'o',  -- Keybinding to toggle the query editor
                    toggle_hl_groups = 'i',      -- Keybinding to toggle highlight groups
                    toggle_injected_languages = 't',  -- Keybinding to toggle injected languages
                    toggle_anonymous_nodes = 'a', -- Keybinding to toggle anonymous nodes
                    toggle_language_display = 'I', -- Keybinding to toggle language display
                    focus_language = 'f',         -- Keybinding to focus language
                    unfocus_language = 'F',       -- Keybinding to unfocus language
                    update = 'R',                 -- Keybinding to refresh the playground
                    goto_node = '<cr>',           -- Keybinding to go to node under cursor
                    show_help = '?',              -- Keybinding to show help
                },
            }
        })
    end
}

