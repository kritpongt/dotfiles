-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Turn off formatoptions
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

-- Turn off spellcheck
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Conceallevel
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

-- Focus buffer when in explorer(Snack.explorer)
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "snacks_picker_list",
--   callback = function(args)
--     local opts = { buffer = args.buf, remap = false, silent = true }
--     vim.keymap.set("n", "<C-PageUp>", function()
--       vim.cmd("wincmd p")
--       vim.cmd("BufferLineCyclePrev")
--     end, opts)
--     vim.keymap.set("n", "<C-PageDown>", function()
--       vim.cmd("wincmd p")
--       vim.cmd("BufferLineCyclePrev")
--     end, opts)
--   end,
-- })

-- Close explorer(Snack.explorer) first when command :q
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
--   group = vim.api.nvim_create_augroup("SnacksExplorerQuit", { clear = true }),
--   callback = function()
--     if vim.v.event.abort then
--       return
--     end
--     if not vim.fn.getcmdline():match("^q[uit]*!?$") then
--       return
--     end
--     local pickers = require("snacks").picker.get({ source = "explorer" })
--     if #pickers == 0 then
--       return
--     end
--     vim.v.event.abort = true
--     vim.schedule(function()
--       for _, p in ipairs(pickers) do
--         p:close()
--       end
--     end)
--   end,
-- })

-- Disable scroll animation(Snacks.scroll) in visual mode
local group_snacks_scroll = vim.api.nvim_create_augroup("SnacksScrollAnimations", { clear = true })
local function snacks_scroll(enable)
  if _G.Snacks and Snacks.scroll then
    if enable then
      Snacks.scroll.enable()
    else
      Snacks.scroll.disable()
    end
  end
end
vim.api.nvim_create_autocmd("ModeChanged", {
  group = group_snacks_scroll,
  pattern = "*:[vV\x16]*",
  callback = function()
    snacks_scroll(false)
  end,
})
vim.api.nvim_create_autocmd("ModeChanged", {
  group = group_snacks_scroll,
  -- pattern = "[vV\x16]*:*",
  pattern = "[vV\x16]*:[^vV\x16]*",
  callback = function()
    snacks_scroll(true)
  end,
})

-- Format
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript" },
  callback = function()
    vim.b.autoformat = true
  end,
})
