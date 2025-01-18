return {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
        require("rose-pine").setup({
            variant = "moon", -- or "main", "moon", "dawn"
            dark_variant = "moon",
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            -- Enable transparency in the theme's setup
            styles = {
                bold = true,
                italic = true,
                transparency = true, -- Set this to true
            },

            enable = {
                terminal = true,
                legacy_highlights = true,
                migrations = true,
            },
        })

        -- Apply the colorscheme
        vim.cmd("colorscheme rose-pine-moon")

        -- Apply transparency settings for Normal and NormalFloat
    end
}

