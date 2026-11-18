return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
      {
				"<A-s>",
				function()
					require("oil").toggle_float(LazyVim.root())
				end,
				desc = "Toggle oil root"
			},
      {
				"<A-e>",
				function()
					require("oil").toggle_float()
				end,
				desc = "Toggle oil"
			},
      { "<leader>e", "<cmd>Oil<cr>", desc = "Oil parent directory" },
    },
    opts = {
      default_file_explorer = true,
      columns = { "icon" },
      delete_to_trash = true,
      view_options = { show_hidden = true },
      keymaps = {
        ["q"] = "actions.close",
        ["<C-c>"] = false,
        ["<C-j>"] = { "j", mode = { "n", "v" } },
        ["<C-k>"] = { "k", mode = { "n", "v" } },
        ["<C-h>"] = { "actions.parent", mode = "n" },
        ["<C-l>"] = { "actions.select", mode = "n" },
        ["<A-p>"] = { "actions.preview", mode = "n" },
      },
      float = { padding = 2, max_width = 0.8, max_height = 0.8, border = "rounded" },
    },
  },
}
