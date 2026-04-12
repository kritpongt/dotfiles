return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
      { "<C-PageUp>", "<cmd>BufferLineCyclePrev<cr>", mode = { "n", "v", "x" }, desc = "Prev Buffer" },
      { "<C-PageDown>", "<cmd>BufferLineCycleNext<cr>", mode = { "n", "v", "x" }, desc = "Next Buffer" },
      { "<C-S-PageUp>", "<cmd>BufferLineMovePrev<cr>", mode = { "n", "v", "x" }, desc = "Move buffer prev" },
      { "<C-S-PageDown>", "<cmd>BufferLineMoveNext<cr>", mode = { "n", "v", "x" }, desc = "Move buffer next" },
    },
    opts = {
      options = {
        mode = "tab",
        numbers = function(opts)
          return string.format("%s", opts.raise(opts.ordinal))
        end,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        buffer_close_icon = "x",
      },
      highlights = {
        info_selected = {
          fg = { attribute = "fg", highlight = "BufferLineBufferSelected" },
        },
        warning_selected = {
          fg = { attribute = "fg", highlight = "BufferLineBufferSelected" },
        },
        error_selected = {
          fg = { attribute = "fg", highlight = "BufferLineBufferSelected" },
        },
        info_diagnostic_selected = {
          bold = false,
          italic = false,
        },
        warning_diagnostic_selected = {
          bold = false,
          italic = false,
        },
        error_diagnostic_selected = {
          bold = false,
          italic = false,
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = function(_, opts)
      opts.options = {
        section_separators = "",
        component_separators = "\u{e621}",
      }
      opts.sections.lualine_a = {
        { "mode", icon = "\u{f121}\u{2009}" },
      }
      table.insert(opts.sections.lualine_x, 1, {
        "encoding",
        padding = { left = 1, right = 1 },
      })
      opts.sections.lualine_z = {}
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        enabled = false,
      },
      views = {
        mini = {
          position = {
            row = -2,
            col = "100%",
          },
        },
      },
      lsp = {
        signature = {
          auto_open = { enabled = false },
        },
      },
      messages = {
        enabled = false,
      },
    },
  },
}
