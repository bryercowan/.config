return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional: Manage LSP servers
            {'williamboman/mason-lspconfig.nvim'}, -- Optional: Bridge between mason and lspconfig

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'L3MON4D3/LuaSnip'},         -- Required: Snippets engine
        },
        config = function()
            -- Setup LSP Zero with recommended settings
            local lsp = require('lsp-zero').preset('recommended')

            -- Ensure that these language servers are installed
            lsp.ensure_installed({
                'ts_ls',  -- JavaScript/TypeScript
                'pyright',   -- Python
                'rust_analyzer', -- Rust
                -- Add more LSP servers as needed
            })

            -- (Optional) Configure LSP server settings for specific languages
            lsp.configure('ts_ls', {
                on_attach = function(client, bufnr)
                    -- Additional configurations for TypeScript server if needed
                end,
                root_dir = require('lspconfig.util').root_pattern(
                    'tsconfig.json',
                    'package.json',
                    '.git'
                )
            })

            -- Setup completion (nvim-cmp)
            local cmp = require('cmp')
            cmp.setup({
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }
            })

            -- Setup LSP
            lsp.setup()

            -- Additional settings for Mason (if using)
            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = { 'ts_ls', 'pyright', 'rust_analyzer' }, -- Add more servers here
            })
        end
    }
}

