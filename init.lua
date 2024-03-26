local modes = { 'n', 'x', 'o' }

for _, mode in ipairs(modes) do
  vim.keymap.set(mode, 'm', 'h')
  vim.keymap.set(mode, 'M', 'H')

  vim.keymap.set(mode, 'h', 'm')
  vim.keymap.set(mode, 'H', 'm')

  -- down
  vim.keymap.set(mode, 'n', 'j')
  vim.keymap.set(mode, 'N', 'J')

  vim.keymap.set(mode, 'j', 'n')
  vim.keymap.set(mode, 'J', 'N')

  -- up
  vim.keymap.set(mode, 'e', 'k')
  vim.keymap.set(mode, 'E', 'K')

  vim.keymap.set(mode, 'k', 'e')
  vim.keymap.set(mode, 'K', 'E')

  -- right
  vim.keymap.set(mode, 'i', 'l')
  vim.keymap.set(mode, 'I', 'L')

  vim.keymap.set(mode, 'l', 'i')
  vim.keymap.set(mode, 'L', 'I')
end
