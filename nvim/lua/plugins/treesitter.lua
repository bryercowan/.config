return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',  -- Automatically update Treesitter parsers
    event = { "BufReadPost", "BufNewFile" },  -- Lazy load Treesitter
    config = function()
        require('nvim-treesitter.configs').setup({
            -- Add the languages you want to enable Treesitter for
            ensure_installed = { "lua", "javascript", "typescript", "html", "css", "python", "rust" },

            -- Automatically install missing parsers when entering a buffer
            auto_install = true,

            highlight = {
                enable = true,  -- Enable syntax highlighting based on Treesitter
                additional_vim_regex_highlighting = false,  -- Disable Vim's built-in syntax highlighting
            },

            indent = {
                enable = true,  -- Enable Treesitter-based indentation
            },
        })
    end
}

