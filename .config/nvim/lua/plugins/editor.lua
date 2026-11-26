return {
  {
    "folke/which-key.nvim",
    keys = {
      { "<leader>w", "<C-w>", remap = false },
    },
    opts = {},
  },
  {
    "folke/flash.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "x", "o" }, false },
      {
        "<leader>sf",
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },
  {
    "saghen/blink.cmp",
    build = "cargo build --release",
    opts = {
      keymap = {
        preset = "default",
        ["<CR>"] = { "fallback" },
        ["<Tab>"] = { "select_and_accept", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
      },
      completion = {
        list = {
          selection = {
            auto_insert = false,
          },
        },
      },
    },
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      {
        "<M-l>",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = "x",
        desc = "Expand Selection",
      },
      {
        "<M-h>",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = "x",
        desc = "Shrink Selection",
      },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
      },
    },
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },
  },
	{
		"stevearc/conform.nvim",
		opts = {
			formatters = {
				-- stylua = {
				-- 	prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
				-- },
			},
		},
	},
	{
		'abecodes/tabout.nvim',
		lazy = false,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			tabkey = "<Tab>",
			backwards_tabkey = "<S-Tab>",
			completion = false,
			act_as_tab = true,
			act_as_shift_tab = false,
			ignore_beginning = true,
			exclude = {},
			tabouts = {
				{ open = "'", close = "'" },
				{ open = '"', close = '"' },
				{ open = '`', close = '`' },
				{ open = '(', close = ')' },
				{ open = '[', close = ']' },
				{ open = '{', close = '}' }
			}
		}
	},
	{
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
    opts = {},
	}
}
