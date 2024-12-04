return {
  {
    'Mofiqul/dracula.nvim',
    config = function()
      local dracula = require 'dracula'
      dracula.setup {
        -- colors = {
        --   bg = '#000000',
        --   visual = '#1b1a2b',
        --   menu = '#1b1a2b',
        --   black = '#1b1a2b',
        --   selection = '#1b1a2b',
        -- },
      }
      dracula.load()
    end,
  },

  {
    'navarasu/onedark.nvim',

    config = function()
      local onedark = require 'onedark'
      onedark.setup {
        style = 'dark',
        code_style = {
          comments = 'none',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none',
        },
        diagnostics = {
          background = false,
        },
      }
      onedark.load()
    end,
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        styles = {
          italic = false,
        },
      }
    end,
  },

  'sainnhe/sonokai',
  'bluz71/vim-moonfly-colors',
  'rebelot/kanagawa.nvim',
  'folke/tokyonight.nvim',
  'catppuccin/nvim',
}
