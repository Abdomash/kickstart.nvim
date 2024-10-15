-- Set the colorscheme
vim.g.colorscheme = 'dracula'

return {
  {
    'Mofiqul/dracula.nvim',
    config = function()
      --   local dracula = require 'dracula'
      --   dracula.setup {
      --     colors = {
      --       bg = '#000000',
      --       visual = '#1b1a2b',
      --       menu = '#1b1a2b',
      --       black = '#1b1a2b',
      --       selection = '#1b1a2b',
      --     },
      --   }
    end,
  },

  'bluz71/vim-moonfly-colors',
  'rebelot/kanagawa.nvim',
  'folke/tokyonight.nvim',
  'catppuccin/nvim',
}
