return {
  'navarasu/onedark.nvim',
  config = function()
    require('onedark').setup {
      -- Main options --
      style = 'deep',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = false,          -- Show/hide background
      term_colors = true,           -- Change terminal color as per the selected theme style
      ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

      -- toggle theme style ---
      toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

      -- Change code style ---
      -- Options are italic, bold, underline, none
      -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
      code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
      },

      -- Lualine options --
      lualine = {
        transparent = false, -- lualine center bar transparency
      },

      -- Custom Highlights --
      colors = {},                                      -- Override default colors
      highlights = {
        Normal = { bg = "NONE" },                       -- Keep background transparent
        Visual = { bg = "#004080", fg = "#555555" },    -- Medium-dark blue for visual selection
        Search = { bg = "#003366", fg = "#555555" },    -- Darker blue for search highlights, with semi-dark grey text
        IncSearch = { bg = "#002244", fg = "#555555" }, -- Even darker blue for incremental search
        Pmenu = { bg = "#001a33" },                     -- Dark navy blue for popup menu background
      },

      -- Plugins Config --
      diagnostics = {
        darker = true,     -- darker colors for diagnostic
        undercurl = true,  -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    }
    vim.cmd("colorscheme onedark")
  end
}
