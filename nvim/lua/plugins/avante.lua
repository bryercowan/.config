return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false,
	opts = {
		provider = "claude",
		auto_suggestions_provider = "claude",
		behaviour = {
			auto_suggestions = false,
			enable_cursor_planning_mode = false,
		},

		providers = {
			openai = {
				endpoint = "https://api.openai.com/v1",
				model = "gpt-4.1-2025-04-14",
				timeout = 30000,
				disable_tools = true,
				extra_request_body = {
					temperature = 0,
					max_completion_tokens = 8192,
					reasoning_effort = "medium",
				},
			},
			claude = {
				endpoint = "https://api.anthropic.com",
				model = "claude-sonnet-4-20250514",
				timeout = 30000, -- Timeout in milliseconds
				extra_request_body = {
					temperature = 0.75,
					max_tokens = 20480,
				},
			},
			ollama = {
				endpoint = "http://localhost:11434",
				model = "codellama:7b-code",
				timeout = 20000,
				extra_request_body = {
					options = {
						format = "json",
						stream = false,
						temperature = 0,
						structured = true,
					},
				},
			},
		},
	},
	-- opts = {
	-- 	provider = "claude",
	-- 	openai = {
	-- 		endpoint = "https://api.anthropic.com",
	-- 		model = "claude-3-7-sonnet-latest",
	-- 		timeout = 30000, -- timeout in milliseconds
	-- 		temperature = 0, -- adjust if needed
	-- 		max_tokens = 200000,
	-- 	},
	-- },
	-- opts = {
	--   provider = "ollama",
	--   ollama = {
	--     model = "codestral",
	--   },
	--   cursor_applying_provider = "ollama",
	--   behaviour = {
	--     enable_cursor_planning_mode = true,
	--   },
	-- },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
