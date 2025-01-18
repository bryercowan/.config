return {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim', -- Required dependency
    },
    config = function()
        local null_ls = require('null-ls')

        null_ls.setup({
            sources = {
                -- Prettier for formatting
                null_ls.builtins.formatting.prettier.with({
                    command = "./node_modules/.bin/prettier", -- Use local Prettier
                }),

                -- ESLint for linting and code actions
                null_ls.builtins.diagnostics.eslint.with({
                    command = "./node_modules/.bin/eslint", -- Use local ESLint
                }),
                null_ls.builtins.code_actions.eslint.with({
                    command = "./node_modules/.bin/eslint", -- Use local ESLint
                }),
            },
        })
    end,
}

