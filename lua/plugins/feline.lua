-----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

-- Plugin: feline.nvim
-- https://github.com/famiu/feline.nvim

-- For the configuration see the Usage section:
--- https://github.com/famiu/feline.nvim/blob/master/USAGE.md

-- Thanks to ibhagwan for the example to follow:
--- https://github.com/ibhagwan/nvim-lua


local colors = require 'colors'

-- monokai colors
local vi_mode_colors = {
  NORMAL = colors.normal,
  INSERT = colors.green,
  VISUAL = colors.yellow,
  OP = colors.cyan,
  BLOCK = colors.cyan,
  REPLACE = colors.red,
  ['V-REPLACE'] = colors.red,
  ENTER = colors.orange,
  MORE = colors.orange,
  SELECT = colors.yellow,
  COMMAND = colors.pink,
  SHELL = colors.pink,
  TERM = colors.pink,
  NONE = colors.purple
}

local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'

local lsp_get_diag = function(str)
  local count = vim.lsp,diagnostic.get_count(0, str)
  return (count > 0) and ' '..count..' ' or ''
end

-- My components
local comps = {
  -- vi_mode -> NORMAL, INSERT..
  vi_mode = {
    left = {
      provider = function()
        local label = ' '..vi_mode_utils.get_vim_mode()..' '
        return label
      end,
      hl = function()
        local set_color = {
          name = vi_mode_utils.get_mode_highlight_name(),
          fg = colors.bg,
          bg = vi_mode_utils.get_mode_color(),
          style = 'bold'
        }
        return set_color
      end,
      left_sep = '',
      right_sep = {'', {str='slant_right', hl = function() local set_color = { fg = vi_mode_utils.get_mode_color(), bg = colors.bg } return set_color end }}}
  },
  -- parse file information
  file = {
    -- file name
    info = {
      provider = {
        name = 'file_info',
        opts = {
          type = 'relative',
          file_modified_icon = ''
        }
      },
      hl = { fg = colors.cyan,
             bg = colors.bg },
      left_sep = '',
      right_sep = {'', {str='slant_left', hl = { fg = colors.bgdark, bg = colors.bg}}},
      icon = ''
    },
    -- file type
    type = {
      provider = { name = 'file_type' },
    },
    -- operating system
    os = {
      provider = function()
        -- local os = vim.bo.fileformat:lower()
        local os = 'mac'
        local icon
        if os == 'unix' then
          icon = '  '
        elseif os == 'mac' then
          icon = '  '
        else
          icon = '  '
        end
        return icon .. os
      end,
      hl = { fg = colors.fg},
      left_sep = {str = 'slant_right', hl = { fg = colors.bgdark, bg = colors.bg }},
      right_sep = ' '
    },
    -- cursor position in %
    line_percentage = {
      provider = { name = 'line_percentage' },
      hl = { fg = colors.pink },
      left_sep = ' ',
      right_sep = ' '
    },
    -- raw-column
    position = {
      provider = {name = 'position'},
      hl = {
        fg = colors.cyan,
        style = 'bold'
      },
      right_sep = ' ',
    },
    -- simple scrollbar (inactive)
    scroll_bar = {
      provider = { name = 'scroll_bar' },
      hl = { fg = colors.fg },
      left_sep = ' ',
      right_sep = ' '
    },
  },
  -- LSP info
  diagnos = {
    err = {
      provider = 'diagnostic_errors',
      icon = '⚠ ',
      hl = { fg = colors.red },
      left_sep = ' ',
    },
    warn = {
      provider = 'diagnostic_warnings',
      icon = ' ',
      hl = { fg = colors.yellow },
      left_sep = ' ',
    },
    info = {
      provider = 'diagnostic_info',
      icon = ' ',
      hl = { fg = colors.green },
      left_sep = ' ',
    },
    hint = {
      provider = 'diagnostic_hints',
      icon = '  ',
      hl = { fg = colors.cyan },
      left_sep = ' ',
      right_sep = ' ',
    },
  },
  lsp = {
    name = {
      provider = 'lsp_client_names',
      icon = '  ',
      hl = { fg = colors.pink, bg = colors.bgdark },
      left_sep = {str = 'slant_left', hl = { bg = colors.bg, fg = colors.bgdark }},
      right_sep = {str = ' ', hl = { bg = colors.bgdark, fg = colors.bgdark }},
    }
  },
  -- git info
  git = {
    branch = {
      provider = 'git_branch',
      icon = ' ',
      hl = { fg = colors.pink, bg = colors.bgdark  },
      left_sep = {str = ' ', hl = { bg = colors.bgdark, fg = colors.bgdark }},
    },
    add = {
      provider = 'git_diff_added',
      hl = { bg = colors.bgdark },
      icon = { str = '  ', hl = { fg = colors.green, bg = colors.bgdark }},
      left_sep = {str = ' ', hl = { bg = colors.bgdark, fg = colors.bgdark }},
    },
    change = {
      provider = 'git_diff_changed',
      hl = { bg = colors.bgdark },
      icon = {str = '  ', hl = { fg = colors.orange, bg = colors.bgdark }},
      left_sep = {str = ' ', hl = { bg = colors.bgdark, fg = colors.bgdark }},
    },
    remove = {
      provider = 'git_diff_removed',
      hl = { bg = colors.bgdark },
      icon = {str = '  ', hl = { fg = colors.red, bg = colors.bgdark }},
      left_sep = {str = ' ', hl = { bg = colors.bgdark, fg = colors.bgdark }},
      right_sep = {{str = ' ', hl = { bg = colors.bgdark, fg = colors.bgdark }}, {str = 'slant_right', hl = { bg = colors.bg, fg = colors.bgdark }}},
    },
  },
}



-- Get active/inactive components
--- see: https://github.com/famiu/feline.nvim/blob/master/USAGE.md#components
local components = {
  active = {},
  inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

-- Right section
table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.git.branch)
table.insert(components.active[1], comps.git.add)
table.insert(components.active[1], comps.git.change)
table.insert(components.active[1], comps.git.remove)
table.insert(components.inactive[1], comps.file.info)

-- Left Section
table.insert(components.active[2], comps.diagnos.err)
table.insert(components.active[2], comps.diagnos.warn)
table.insert(components.active[2], comps.diagnos.hint)
table.insert(components.active[2], comps.diagnos.info)
table.insert(components.active[2], comps.lsp.name)
table.insert(components.active[2], comps.file.os)
table.insert(components.active[2], comps.file.line_percentage)
table.insert(components.active[2], comps.file.position)

-- call feline
require('feline').setup {
  colors = {
    bg = colors.bg,
    fg = colors.fg
  },
  components = components,
  vi_mode_colors = vi_mode_colors,
  force_inactive = {
    filetypes = {
      'NvimTree',
      'vista',
      'term'
    },
    buftypes = {},
    bufnames = {},
  },
}
