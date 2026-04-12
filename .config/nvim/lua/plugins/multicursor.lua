return {
  -- Hack: Replaces all selection

  --  Command Seq.          Descripttion
  -- -------------------------------------------------------
  -- 1. *                   : Highlights word under cursor
  -- 2. :%s//<replace>/g    : Quick buffer-wide replacement

  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      set({ "n" }, "<C-n>", function()
        vim.cmd("normal! viw")
      end)
      set({ "x" }, "<C-n>", function()
        mc.matchAddCursor(1)
      end)
      set({ "x" }, "<leader><C-n>", function()
        mc.matchSkipCursor(1)
      end, { desc = "Skip Next Find Match" })
      set({ "n" }, "<C-p>", function()
        vim.cmd("normal! viw")
      end)
      set({ "x" }, "<C-p>", function()
        mc.matchAddCursor(-1)
      end)
      set({ "x" }, "<leader><C-p>", function()
        mc.matchSkipCursor(-1)
      end, { desc = "Skip Previous Find Match" })

      mc.addKeymapLayer(function(layerSet)
        layerSet({ "n" }, "<esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)

      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { reverse = true })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorMatchPreview", { link = "Search" })
      hl(0, "MultiCursorDisabledCursor", { reverse = true })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
  },
}
