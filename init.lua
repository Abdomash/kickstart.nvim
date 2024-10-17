-- NOTE: Must happen before plugins are loaded
-- [[ Global settings ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.termguicolors = true

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Custom colorscheme
  require 'abdo.colors',

  -- File Explorer
  require 'abdo.plugins.neo-tree',

  -- Toggle Comments
  'tpope/vim-commentary',

  -- Copilot
  'github/copilot.vim',

  -- Git Signs
  require 'abdo.plugins.gitsigns',

  -- Pending Keybinds.
  require 'abdo.plugins.which-key',

  -- Fuzzy Finder (files, lsp, etc)
  require 'abdo.plugins.telescope',

  -- LSP Plugins
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },

  -- Main LSP Configuration
  require 'abdo.plugins.lsp-config',

  -- Autoformat
  require 'abdo.plugins.conform',

  -- Autocompletion
  require 'abdo.plugins.nvim-cmp',

  -- Highlight colors in hex, rgb, etc
  -- 'chrisbra/Colorizer',

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- Utility tool for LSPs
  {
    'nvimtools/none-ls.nvim',
    config = function()
      require('null-ls').setup()
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  },

  -- Collection of various small independent plugins/modules
  require 'abdo.plugins.mini',

  -- Highlight, edit, and navigate code
  require 'abdo.plugins.treesitter',

  -- TODO: configure and move to abdo folder
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- [[ Load my configs ]]
require 'abdo.options'
require 'abdo.remap'
require 'abdo.autocmd'

vim.cmd('colorscheme ' .. vim.g.colorscheme)
