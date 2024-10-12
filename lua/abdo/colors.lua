return {
  {
    'Mofiqul/dracula.nvim',
    config = function()
      local dracula = require 'dracula'
      dracula.setup {
        colors = {
          bg = '#000000',
          visual = '#1b1a2b',
          menu = '#1b1a2b',
          black = '#1b1a2b',
          selection = '#1b1a2b',
        },
      }
      vim.cmd 'colorscheme dracula'
    end,
  },
}
