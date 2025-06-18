return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional: Manage LSP servers
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional: Bridge between mason and lspconfig

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required: Snippets engine
		},
		config = function()
			-- Setup LSP Zero with recommended settings
			local lsp = require("lsp-zero").preset("recommended")

			-- (Optional) Configure LSP server settings for specific languages
			lsp.configure("ts_ls", {
				on_attach = function(client, bufnr)
					-- Additional configurations for TypeScript server if needed
				end,
				root_dir = require("lspconfig.util").root_pattern("tsconfig.json", "package.json", ".git"),
			})

			local cmp = require("cmp")
			cmp.setup({
				mapping = {
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				},
			})

			-- Setup LSP
			lsp.setup()

			-- Additional settings for Mason (if using)
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "pyright", "rust_analyzer", "hls", "lua_ls", "intelephense" }, -- Add more servers here
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				},
			})
		end,
	},
}
