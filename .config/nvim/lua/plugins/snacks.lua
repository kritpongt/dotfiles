return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<A-s>",
        function()
          require("snacks").explorer({ cwd = LazyVim.root() })
        end,
        mode = { "n", "v" },
        remap = false,
        desc = "Explorer Snacks (root dir)",
      },
      {
        "<C-w>",
        function()
          require("snacks").bufdelete()
          -- vim.schedule(function()
          --   local bufs = vim.fn.getbufinfo({ buflisted = 1 })
          --   -- print("Debug: bufs type is " .. type(bufs) .. ", value is " .. tostring(bufs))
          --   if #bufs <= 1 and bufs[1].name == "" then
          --     Snacks.dashboard.open()
          --   end
          -- end)
        end,
        desc = "Close Current Buffer",
      },

      -- Disable Terminal
      { "<c-/>", "", desc = "Toggle Terminal" },
      { "<c-_>", "", desc = "which_key_ignore" },
    },
    opts = function(_, opts)
      opts.picker.hidden = true
      opts.picker.ignored = true

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
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          -- { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      }
    end,
  },
}
