-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>gb", ":BlameToggle<CR>")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-c>", "<C-w>c", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
  print("Copied relative path: " .. vim.fn.expand("%"))
end)

-- Theme toggle functions
local function toggle_background()
  local cat = require("catppuccin")
  local current = vim.g.catppuccin_transparent
  if current == nil then
    current = true
  end
  vim.g.catppuccin_transparent = not current
  
  cat.setup({
    transparent_background = vim.g.catppuccin_transparent,
  })
  vim.cmd.colorscheme("catppuccin")
  
  if vim.g.catppuccin_transparent then
    print("Background: Transparent")
  else
    print("Background: Solid")
  end
end

local function switch_theme()
  local current = vim.g.colors_name
  print("Current theme: " .. (current or "none")) -- Debug line
  if current == "catppuccin-mocha" or current == "catppuccin" then
    vim.cmd("ColorschemeAngelGlitch")
    print("Theme: Angel Glitch Green")
  elseif current == "angel_glitch_green" then
    vim.cmd.colorscheme("catppuccin")
    print("Theme: Catppuccin")
  else
    -- Default case - go to catppuccin if unknown theme
    vim.cmd.colorscheme("catppuccin")
    print("Theme: Catppuccin (default)")
  end
end

-- Theme toggles
vim.keymap.set("n", "<leader>tb", toggle_background, { desc = "Toggle background transparency" })
vim.keymap.set("n", "<leader>tt", switch_theme, { desc = "Switch colorscheme" })
