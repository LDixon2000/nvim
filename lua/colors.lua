-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- Import colorscheme with:
--- require('colors')


--[[
-- Theme: monokai (classic)
--- See: https://github.com/tanvirtin/monokai.nvim/blob/master/lua/monokai.lua
local _M = {
  bg = '#202328', --default: #272a30
  fg = '#f8f8f0',
  pink = '#f92672',
  green = '#a6e22e',
  cyan = '#78dce8',
  yellow = '#e6db74',
  orange = '#fa8419',
  purple = '#9c64fe',
  red = '#ed2a2a',
}

return _M
]]--


--[[ Theme: Rosé Pine
--- See: https://github.com/rose-pine/neovim#custom-colours
--- color names are adapted to the format above
local _M = {
  bg = '#111019',
  fg = '#e0def4',
  pink = '#eb6f92',
  green = '#1f1d2e',
  cyan = '#31748f',
  yellow = '#f6c177',
  orange = '#2a2837',
  purple = '#c4a7e7',
  red = '#ebbcba',
}

return _M

]]--

local _M = {
  bg = '#3c3836',
  bgdark = '#282828',
  fg = '#ebdbb2',
  pink = '#d3869b',
  green = '#b8bb26',
  cyan = '#83a598',
  yellow = '#fabd2f',
  orange = '#fe8019',
  purple = '#b16286',
  red = '#fb4934',
  normal = '#a89984',
  visual = '#a89984',
  insert = '#a89984',
  file = 'a89984',
  git = '',
  errors = 'a89984',
  lsp = 'a89984',
  system = 'a89984',
  pageLocation = 'a89984',
  lineLocation = 'a89984',
}
return _M
