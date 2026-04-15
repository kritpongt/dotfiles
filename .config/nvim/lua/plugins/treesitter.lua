return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "cpp"
          "css",
          "gitignore",
          "go",
          "graphql",
          "http",
          "java",
          "php",
          "rust",
          "scss",
          "sql",
          "svelte",
          "vue",
        })
      end
    end
  },

  -- Selection Incremental
  -- {
  --   "MeanderingProgrammer/treesitter-modules.nvim",
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   opts = {
  --     incremental_selection = {
  --       enable = true,
  --       keymaps = {
  --         node_incremental = "v",
  --         node_decremental = "V",
  --       },
  --     },
  --   },
  -- },
  {
    "sustech-data/wildfire.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      {
        "vv",
        function()
          require("wildfire").init_selection()
        end,
        mode = "n",
        desc = "Wildfire Init Selection",
      },
    },
    opts = {
      surrounds = {
        { "(", ")" },
        { "{", "}" },
        { "<", ">" },
        { "[", "]" },
      },
      keymaps = {
        node_incremental = "v",
        node_decremental = "V",
      },
      filetype_exclude = { "qf" },
    },
  },
}
