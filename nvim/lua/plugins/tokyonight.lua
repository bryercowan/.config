return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "storm",
    transparent = false,
  },
  config = function()
    vim.cmd("colorscheme tokyonight-storm")
  end,

}
