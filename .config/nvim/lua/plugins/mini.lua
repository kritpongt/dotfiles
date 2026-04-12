return {
  {
    "nvim-mini/mini.ai",
    keys = {
      {
        "<M-l>",
        function()
          vim.cmd("normal vie")
        end,
        mode = "n",
        remap = false,
      },
    },
  },
  {
    "nvim-mini/mini.pairs",
    opts = {
      modes = { insert = true, command = false, terminal = false },
    },
  },
}
