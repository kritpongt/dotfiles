return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "html",
        "css",
        "json",
        "javascript",
        "typescript",
        "php",
        "vue",
        "tsx",
        "query",
        "go",
        "c",
        "java",
        "python",
        "lua",
        "yaml",
        "graphql",
        "http",
        "bash",
        "dockerfile",
        "gitignore",
        "markdown",
        "markdown_inline",
        "vim",
        "vimdoc",
      },
    },
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
