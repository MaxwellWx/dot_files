return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        transparent_background = true,
        auto_integrations = true,
        styles = {
          comments = {},
        },
        custom_highlights = function(c)
          return {
            Cursor = { fg = c.crust, bg = c.rosewater },
            NormalFloat = { fg = c.text, bg = c.mantle },
            FloatBorder = { fg = c.surface2, bg = c.mantle },
          }
        end,
      }
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
}
