-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local modes = { "n", "x", "o" }

for _, mode in ipairs(modes) do
  vim.keymap.set(mode, "m", "h")
  vim.keymap.set(mode, "M", "H")

  vim.keymap.set(mode, "h", "m")
  vim.keymap.set(mode, "H", "m")

  -- down
  vim.keymap.set(mode, "n", "j")
  vim.keymap.set(mode, "N", "J")

  vim.keymap.set(mode, "j", "n")
  vim.keymap.set(mode, "J", "N")

  -- up
  vim.keymap.set(mode, "e", "k")
  vim.keymap.set(mode, "E", "K")

  vim.keymap.set(mode, "k", "e")
  vim.keymap.set(mode, "K", "E")

  -- right
  vim.keymap.set(mode, "i", "l")
  vim.keymap.set(mode, "I", "L")

  vim.keymap.set(mode, "l", "i")
  vim.keymap.set(mode, "L", "I")
end

vim.keymap.set({ "n", "x" }, "<C-M>", "<C-W>h")
vim.keymap.set({ "n", "x" }, "<C-N>", "<C-W>j")
vim.keymap.set({ "n", "x" }, "<C-E>", "<C-W>k")
vim.keymap.set({ "n", "x" }, "<C-I>", "<C-W>l")
