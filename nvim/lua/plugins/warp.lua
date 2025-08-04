return {
	"Theo-Steiner/warped.nvim",
	lazy = false,
	priority = 900,

	dependencies = {
		{
			"tjdevries/colorbuddy.nvim",
			tag = "v1.0.0",
			lazy = false,
		},
	},

	config = function()
		require("warped").setup()

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
				vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
				vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
				vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
				vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
				vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
			end,
		})
	end,
}
