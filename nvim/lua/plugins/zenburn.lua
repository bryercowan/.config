return {
    'phha/zenburn.nvim',
    config = function()
        require('zenburn').setup({
            -- Enable transparency or other settings here if needed
        })
        vim.cmd("colorscheme zenburn")
    end
}

