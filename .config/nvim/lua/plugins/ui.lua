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
        { "mode", icon = "\u{f0fc8}" },
      }

			opts.sections.lualine_c = vim.tbl_filter(function(comp)
				return not (type(comp) == "table" and comp[1] == "filetype")
			end, opts.sections.lualine_c)

			-- opts.sections.lualine_x = vim.list_extend({
			-- 	{ "filetype", icon_only = false, padding = { left = 1, right = 1 } },
			-- 	{ "encoding", padding = { left = 1, right = 1 } },
			-- }, opts.sections.lualine_x)
			local x = opts.sections.lualine_x
			for i, comp in ipairs(x) do
				if type(comp) == "table" and comp[1] == "diff" then
					table.remove(x, i)
					table.insert(x, 1, comp)
					break
				end
			end
			table.insert(x, 2, { "filetype", icon_only = false, padding = { left = 1, right = 1 },
				fmt = function(ft)
					local alias = {
						javascript = "js",
						typescript = "ts",
						javascriptreact = "jsx",
						typescriptreact = "tsx",
					}
					return alias[ft] or ft
				end
			})
			table.insert(x, 3, { "encoding", padding = { left = 1, right = 1 } })

			local lazy_status = require("lazy.status")
			opts.sections.lualine_x = vim.tbl_filter(function(comp)
				return not (type(comp) == "table" and comp[1] == lazy_status.updates)
			end, opts.sections.lualine_x)

			opts.sections.lualine_z = {
        {
          -- lazy_status.updates,
          -- cond = lazy_status.has_updates,
					function()
						local updates = lazy_status.updates()
						local icon = require("lazy.core.config").options.ui.icons.plugin
						return updates or vim.trim(icon)
					end,
          color = function()
            return { bg = Snacks.util.color("Special") }
          end,
        },
      }
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
