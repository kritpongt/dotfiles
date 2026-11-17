return {
	{
		"folke/snacks.nvim",
		keys = {
			-- {
			-- 	"<A-s>",
			-- 	function()
			-- 		require("snacks").explorer({ cwd = LazyVim.root() })
			-- 	end,
			-- 	mode = { "n", "v" },
			-- 	remap = false,
			-- 	desc = "Explorer Snacks (root dir)",
			-- },
			{
				"<C-w>",
				function()
					if vim.api.nvim_win_get_config(0).relative ~= "" then
						return
					end
					require("snacks").bufdelete()
				end,
				desc = "Close Current Buffer",
			},

			-- Disable Terminal
			{ "<c-/>", "", desc = "Toggle Terminal" },
			{ "<c-_>", "", desc = "which_key_ignore" },
		},
		opts = function(_, opts)
			opts.picker = opts.picker or {}
			opts.picker.hidden = true
			-- opts.picker.ignored = true

			-- opts.picker.sources = opts.picker.sources or {}
			-- opts.picker.sources.explorer = {
			-- 	layout = {
			-- 		layout = {
			-- 			width = 0.2,
			-- 			min_width = 0,
			-- 		}
			-- 	},
			-- }
			opts.explorer = { enabled = false }

			opts.picker.win = opts.picker.win or {}
			opts.picker.win.input = opts.picker.win.input or {}
			opts.picker.win.input.keys = opts.picker.win.input.keys or {}
			opts.picker.win.list = opts.picker.win.list or {}
			opts.picker.win.list.keys = opts.picker.win.list.keys or {}
			opts.picker.win.input.keys["<C-l>"] = { "confirm", mode = { "n", "i" } }
			opts.picker.win.list.keys["<C-l>"] = "confirm"
			-- opts.picker.win.list.keys["<Space>"] = { "select_and_next", mode = "n" }
			-- opts.picker.win.list.keys["<BS>"] = { "select_and_prev", mode = "n" }
			-- for _, name in ipairs({ "input", "list", "preview" }) do
			-- 	opts.picker.win[name] = opts.picker.win[name] or {}
			-- 	opts.picker.win[name].keys = opts.picker.win[name].keys or {}
			-- 	opts.picker.win[name].keys["<Tab>"] = { "cycle_win", mode = { "n", "i" } }
			-- 	opts.picker.win[name].keys["<S-Tab>"] = false
			-- end

			local logo = [[
 ██████   █████                                ███                 
░░██████ ░░███                                ░░░                  
 ░███░███ ░███   ██████   ██████  █████ █████ ████  █████████████  
 ░███░░███░███  ███░░███ ███░░███░░███ ░░███ ░░███ ░░███░░███░░███ 
 ░███ ░░██████ ░███████ ░███ ░███ ░███  ░███  ░███  ░███ ░███ ░███ 
 ░███  ░░█████ ░███░░░  ░███ ░███ ░░███ ███   ░███  ░███ ░███ ░███ 
 █████  ░░█████░░██████ ░░██████   ░░█████    █████ █████░███ █████
░░░░░    ░░░░░  ░░░░░░   ░░░░░░     ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░ ]]
			opts.dashboard = opts.dashboard or {}
			opts.dashboard = {
				preset = {
					header = logo,
				},
				sections = {
					{ section = "header" },
					{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
					{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
					{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
					{ section = "startup" },
				},
			}
		end,
	},
}
