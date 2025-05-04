return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
      formatters = {
        prettier = {
          command = "./node_modules/.bin/prettier",
          condition = function(ctx)
            return vim.fs.find(
              { "node_modules/.bin/prettier" },
              { upward = true, path = ctx.bufname }
            )[1]
          end,
        },
      },
    })
  end,
}
