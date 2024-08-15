-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Function to enter custom visual mode with 'mnei' keys for movement
function EnterCustomVisualMode()
  vim.cmd("normal! v")
  vim.api.nvim_buf_set_keymap(0, "x", "m", "h", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "x", "n", "j", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "x", "e", "k", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "x", "i", "<Right>", { noremap = true, silent = true })
end

-- Map <leader>v to enter custom visual mode
vim.keymap.set("n", "<leader>v", ":lua EnterCustomVisualMode()<CR>", { noremap = true, silent = true })

local modes = { "n", "x", "o", "v" }

for _, mode in ipairs(modes) do
  vim.keymap.set(mode, "m", "h", { noremap = true, silent = true })
  vim.keymap.set(mode, "M", "H", { noremap = true, silent = true })

  vim.keymap.set(mode, "h", "m", { noremap = true, silent = true })
  vim.keymap.set(mode, "H", "m", { noremap = true, silent = true })

  -- down
  vim.keymap.set(mode, "n", "j", { noremap = true, silent = true })
  vim.keymap.set(mode, "N", "J", { noremap = true, silent = true })

  vim.keymap.set(mode, "j", "n", { noremap = true, silent = true })
  vim.keymap.set(mode, "J", "N", { noremap = true, silent = true })

  -- up
  vim.keymap.set(mode, "e", "k", { noremap = true, silent = true })
  vim.keymap.set(mode, "E", "K", { noremap = true, silent = true })

  vim.keymap.set(mode, "k", "e", { noremap = true, silent = true })
  vim.keymap.set(mode, "K", "E", { noremap = true, silent = true })

  -- right
  vim.keymap.set(mode, "i", "l", { noremap = true, silent = true })
  vim.keymap.set(mode, "I", "L", { noremap = true, silent = true })

  vim.keymap.set(mode, "l", "i", { noremap = true, silent = true })
  vim.keymap.set(mode, "L", "I", { noremap = true, silent = true })
end

vim.keymap.set({ "n", "x" }, "<C-M>", "<C-W>h", { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "<C-N>", "<C-W>j", { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "<C-E>", "<C-W>k", { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "<C-I>", "<C-W>l", { noremap = true, silent = true })
