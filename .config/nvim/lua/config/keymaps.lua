-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copy/Paste use system clipboard
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true, desc = "Copy" })
vim.keymap.set("i", "<C-v>", "<C-r>+<Esc>", { noremap = true, silent = true, desc = "Paste" })

-- Undo/Redo
vim.keymap.set({ "n", "i", "v" }, "<C-z>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-y>", "<Nop>", { silent = true })
vim.keymap.set("n", "<C-z>", "u", { noremap = true, silent = true, desc = "Undo" })
vim.keymap.set("n", "<C-y>", "<C-r>", { noremap = true, silent = true, desc = "Redo" })
vim.keymap.set({ "i", "v" }, "<C-z>", "<Esc>u", { noremap = true, silent = true, desc = "Undo" })
vim.keymap.set({ "i", "v" }, "<C-y>", "<Esc><C-r>", { noremap = true, silent = true, desc = "Redo" })

-- Increment/Decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "_", "<C-x>")

-- Indent shift
vim.keymap.set("n", "<", "<<", { desc = "Indent Left" })
vim.keymap.set("n", ">", ">>", { desc = "Indent Right" })

-- Select all
vim.keymap.set({ "n", "v", "i" }, "<C-a>", function()
  vim.cmd("normal! ggVG")
end, { noremap = true, silent = true, desc = "Select all" })

-- Ctrl + Backspace
-- vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true, buffer = true, silent = true })
vim.keymap.set("i", "<C-h>", "<C-w>", { noremap = true, silent = true })
vim.keymap.set("c", "<C-h>", "<C-w>", { noremap = true })

-- Duplicate line up/down
vim.keymap.set("n", "<A-S-K>", "yyP")
vim.keymap.set("v", "<A-S-K>", "y'>pgv")
vim.keymap.set("n", "<A-S-J>", "yyp")
vim.keymap.set("v", "<A-S-J>", "yPgv")

-- Toggle comment "gc" (O-PENDING mode)
vim.keymap.set("o", "c", function()
  vim.cmd("normal gcc")
end, { noremap = true, desc = "Toggle comment" })

-- Wrapping tag inner/outer
vim.keymap.set({ "n" }, "<M-i>", function()
  vim.cmd("normal! vit")
  vim.cmd("normal! o")
end, { noremap = true, silent = true })
vim.keymap.set({ "v" }, "<M-i>", function()
  vim.cmd("normal! it")
  vim.cmd("normal! o")
end, { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<M-o>", function()
  vim.cmd("normal! vat")
  vim.cmd("normal! o")
end, { noremap = true, silent = true })
vim.keymap.set({ "v" }, "<M-o>", function()
  vim.cmd("normal! at")
  vim.cmd("normal! o")
end, { noremap = true, silent = true })

-- Wrap with abbreviation
vim.keymap.set("v", "<M-u>", function()
  vim.cmd("normal St")
end, { noremap = true, silent = true })
