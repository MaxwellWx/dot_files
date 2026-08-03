return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,

    build = ':TSUpdate',

    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {
          enable = true,
        },
      },
    },

    config = function()
      ------------------------------------------------------------
      -- Filetype
      ------------------------------------------------------------

      vim.filetype.add {
        extension = {
          nu = 'nu',
        },
      }

      ------------------------------------------------------------
      -- nvim-treesitter
      ------------------------------------------------------------

      require('nvim-treesitter').setup()

      ------------------------------------------------------------
      -- Parsers
      ------------------------------------------------------------

      local parsers = {
        'bash',
        'c',
        'cpp',
        'diff',
        'nu',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',

        -- LaTeX
        'latex',
        'bibtex',
      }

      require('nvim-treesitter').install(parsers)

      ------------------------------------------------------------
      -- Parser/filetype mapping
      ------------------------------------------------------------

      vim.treesitter.language.register('latex', 'tex')
      vim.treesitter.language.register('bibtex', 'bib')

      ------------------------------------------------------------
      -- Treesitter highlighting
      ------------------------------------------------------------

      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'sh',
          'bash',
          'c',
          'cpp',
          'diff',
          'nu',
          'html',
          'lua',
          'markdown',
          'query',
          'vim',

          -- LaTeX
          'tex',
          'bib',
        },

        callback = function()
          pcall(vim.treesitter.start)
        end,
      })

      ------------------------------------------------------------
      -- Treesitter indentation
      ------------------------------------------------------------

      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'sh',
          'bash',
          'c',
          'cpp',
          'nu',
          'html',
          'lua',
          'tex',
          'bib',
        },

        callback = function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
