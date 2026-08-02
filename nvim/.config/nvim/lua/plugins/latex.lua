return {
  {
    'lervag/vimtex',

    lazy = false,

    init = function()
      -- VimTeX configuration

      vim.g.vimtex_compiler_method = 'latexmk'

      -- WSLg / Wayland
      vim.g.vimtex_view_method = 'zathura_simple'

      vim.g.vimtex_quickfix_open_on_warning = 0

      vim.g.vimtex_quickfix_autoclose_after_keystrokes = 2

      vim.g.vimtex_syntax_conceal_disable = 1

      -- latexmk options
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = '',
        out_dir = '',
        callback = 1,
        continuous = 1,
        executable = 'latexmk',
        options = {
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
        },
      }
    end,
  },
}
