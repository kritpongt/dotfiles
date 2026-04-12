return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      style = "night",
      transparent = true,
      on_highlights = function(hl, c)
        hl.WinSeparator = {
          fg = c.fg_gutter,
        }
        hl.String = { fg = "#928374" }
      end,
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      on_highlights = function(hl, c)
        hl.TabLineFill = { bg = c.none }
        hl.BufferLineHintSelected = { fg = c.base1, italic = true, bold = true }
      end,
    },
  },
}
