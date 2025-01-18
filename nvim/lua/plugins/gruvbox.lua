return {
    'ellisonleao/gruvbox.nvim',
    config = function()
        require("gruvbox").setup({
            contrast = "soft", -- Options: hard, soft, medium
            transparent_mode = true,
        })
        vim.cmd("colorscheme gruvbox")
    end
}
