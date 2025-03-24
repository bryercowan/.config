return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require('nvim-tree').setup({
      filters = {
        dotfiles = false,
        custom = { "^.git$" }, -- Only exclude .git directory, show everything else including .env
      },
      git = {
        ignore = false,
      },
      renderer = {
        highlight_git = true,
        special_files = { "README.md", "Makefile", "MAKEFILE", ".env" }, -- Highlight .env files
      },
    })
  end
}
