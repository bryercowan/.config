return {
  {
    "rktjmp/lush.nvim",
    priority = 1000,
    config = function()
      local lush = require("lush")
      local hsl = lush.hsl

      -- Angel Glitch inspired palette
      -- local bg = hsl("#0a0a0a") -- deep black
      -- local fg = hsl("#d9d9d9") -- soft white text
      -- local red = hsl("#ff4d4d") -- glowing red accent
      -- local cyan = hsl("#6ae9ff") -- glitch cyan
      -- local muted = hsl("#555555") -- for comments / guides
      -- local softbg = hsl("#161616") -- subtle highlight background
      -- local brightbg = hsl("#222222")
      --
      -- local angel_glitch = lush(function()
      --   return {
      --     Normal({ bg = "none", fg = fg }),
      --     Comment({ fg = muted, gui = "italic" }),
      --     Constant({ fg = red }),
      --     String({ fg = hsl("#ff7373") }),
      --     Number({ fg = red }),
      --     Keyword({ fg = cyan, gui = "bold" }),
      --     Identifier({ fg = fg }),
      --     Function({ fg = cyan.saturate(10).lighten(10), gui = "bold" }),
      --     Statement({ fg = red, gui = "bold" }),
      --     Type({ fg = hsl("#d0d0d0") }),
      --     Operator({ fg = hsl("#aaaaaa") }),
      --     Pmenu({ bg = softbg, fg = fg }),
      --     PmenuSel({ bg = red, fg = bg }),
      --     LineNr({ fg = muted }),
      --     CursorLine({ bg = softbg }),
      --     CursorLineNr({ fg = cyan, gui = "bold" }),
      --     Visual({ bg = hsl("#e0f7ff"), fg = bg, gui = "bold" }),
      --     Search({ bg = cyan, fg = bg, gui = "bold" }),
      --     StatusLine({ bg = brightbg, fg = fg }),
      --     VertSplit({ fg = softbg }),
      --     DiagnosticError({ fg = red }),
      --     DiagnosticWarn({ fg = hsl("#ffb84d") }),
      --     DiagnosticInfo({ fg = cyan }),
      --     DiagnosticHint({ fg = hsl("#89cfff") }),
      --   }
      -- end)

      local bg = hsl("#050505") -- pure black base
      local fg = hsl("#e0e0e0") -- readable light gray
      local neon_green = hsl("#5CFF5C") -- primary glowing green
      local lime = hsl("#A7FF5A") -- secondary highlight
      local yellow = hsl("#E5FF77") -- accent pop
      local muted = hsl("#4a4a4a") -- for comments/gutters
      local softbg = hsl("#101010") -- slight contrast background
      local brightbg = hsl("#1a1a1a")
      local cyan = hsl("#5AEAFF") -- glitch contrast edge
      local red = hsl("#ff5555") -- retain red for contrast accents

      local angel_glitch_green = lush(function()
        return {
          Normal({ bg = "none", fg = fg }),
          Comment({ fg = muted, gui = "italic" }),
          Constant({ fg = lime }),
          String({ fg = yellow }),
          Number({ fg = lime }),
          Keyword({ fg = neon_green, gui = "bold" }),
          Identifier({ fg = fg }),
          Function({ fg = neon_green.lighten(10), gui = "bold" }),
          Statement({ fg = cyan, gui = "bold" }),
          Type({ fg = hsl("#b8ffb8") }),
          Operator({ fg = lime }),
          Pmenu({ bg = softbg, fg = fg }),
          PmenuSel({ bg = lime, fg = bg, gui = "bold" }),
          LineNr({ fg = muted }),
          CursorLine({ bg = softbg }),
          CursorLineNr({ fg = neon_green, gui = "bold" }),
          Visual({ bg = hsl("#ccffcc"), fg = bg, gui = "bold" }),
          Search({ bg = neon_green, fg = bg, gui = "bold" }),
          StatusLine({ bg = brightbg, fg = lime }),
          VertSplit({ fg = softbg }),
          DiagnosticError({ fg = red }),
          DiagnosticWarn({ fg = yellow }),
          DiagnosticInfo({ fg = cyan }),
          DiagnosticHint({ fg = lime }),
        }
      end)

      lush(angel_glitch_green)
      
      -- Register the custom colorscheme
      vim.api.nvim_create_user_command("ColorschemeAngelGlitch", function()
        lush(angel_glitch_green)
        vim.g.colors_name = "angel_glitch_green"
      end, {})
    end,
  },
}
