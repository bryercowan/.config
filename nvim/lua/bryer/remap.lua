vim.g.mapleader = " "
vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gb", ":BlameToggle<CR>")
vim.keymap.set("n", "<leader>fw", function()
	builtin.grep_string({ search = vim.fn.expand("<cword>") })
end, { desc = "Search word under cursor" })
vim.keymap.set("n", "<leader>gd", function()
	require("telescope.builtin").lsp_definitions({
		jump_type = "never",
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local actions = require("telescope.actions")
				local action_state = require("telescope.actions.state")
				local picker = action_state.get_current_picker(prompt_bufnr)
				local results = picker:get_multi_selection()

				if #results == 0 then
					results = { action_state.get_selected_entry() }
				end

				actions.close(prompt_bufnr)
				for _, entry in ipairs(results) do
					vim.cmd("edit " .. entry.filename)
					vim.fn.cursor(entry.lnum, entry.col)
				end
			end)
			return true
		end,
	})
end, { desc = "Telescope: Go to definition (smart jump)" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-c>", "<C-w>c", { noremap = true, silent = true })
