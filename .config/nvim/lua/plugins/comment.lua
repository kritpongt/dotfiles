return {
  {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    keys = {
      -- { "gc", mode = { "n", "v" } },
      -- { "gcc", mode = "n" },
      { "gb", mode = "v" },
      { "<C-_>", "gb", mode = "v", remap = true, desc = "Comment blockwise (visual)" },
    },
    opts = function()
      return {
        mappings = {
          extra = false,
        },
        ignore = "^$",
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
}
