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
}
