vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>fw', function()
    builtin.grep_string({ search = vim.fn.expand('<cword>') })
end, { desc = 'Search word under cursor' })
