print("BOOTED UP BRYER")
vim.opt.clipboard = "unnamedplus"
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.json", "*.css", "*.scss", "*.html", "*.md" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Set indentation for all file types
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.shiftwidth = 2        -- Number of spaces for autoindent
vim.opt.tabstop = 2           -- Number of spaces for a tab
vim.opt.softtabstop = 2       -- Number of spaces for Tab key
vim.opt.smartindent = true    -- Auto-indent new lines
vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative numbers
vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative numbers
vim.opt.wrap = true           -- Enable line wrapping
vim.opt.linebreak = true      -- Wrap at word boundaries
vim.opt.showbreak = ">> "     -- Show prefix for wrapped lines
