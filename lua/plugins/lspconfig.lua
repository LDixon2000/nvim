return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- web
        html = {},
        cssls = {},
        vls = {},
        tsserver = {},
        jsonls = {},
        tailwindcss = {},

        pyright = {},
        lua_ls = {},
        yamlls = {},
      },
    },
  },
}
