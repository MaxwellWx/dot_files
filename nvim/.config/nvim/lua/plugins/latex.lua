return {
  {
    'lervag/vimtex',

    lazy = false,

    init = function()
      -- -----------------------------------------------------
      -- Compiler
      -- -----------------------------------------------------

      vim.g.vimtex_compiler_method = 'latexmk'

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

      -- -----------------------------------------------------
      -- PDF viewer
      --
      -- WSL Neovim -> Windows SumatraPDF
      -- -----------------------------------------------------

      vim.g.vimtex_view_method = 'general'

      vim.g.vimtex_view_general_viewer = vim.fn.expand '~/scripts/vimtex_sumatra/vimtex_sumatra.sh'

      vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

      -- -----------------------------------------------------
      -- Quickfix
      -- -----------------------------------------------------

      vim.g.vimtex_quickfix_open_on_warning = 0

      vim.g.vimtex_quickfix_autoclose_after_keystrokes = 2

      -- -----------------------------------------------------
      -- Syntax
      -- -----------------------------------------------------

      vim.g.vimtex_syntax_conceal_disable = 1
    end,
  },
}
