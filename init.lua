-- [[ Global settings ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.termguicolors = true
vim.g.colorscheme = 'kanagawa'
vim.g.transparent_bg = false

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
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'folke/which-key.nvim', -- Show keybindings
  'github/copilot.vim',

  -- Tmux & Neovim integration
  {
    'christoomey/vim-tmux-navigator',
    keys = { '<C-h>', '<C-j>', '<C-k>', '<C-l>' },
  },

  require 'abdo.colors',
  require 'abdo.plugins.neo-tree',
  require 'abdo.plugins.gitsigns',
  require 'abdo.plugins.telescope',
  require 'abdo.plugins.lsp-config',
  require 'abdo.plugins.conform',
  require 'abdo.plugins.nvim-cmp',
  require 'abdo.plugins.mini',
  require 'abdo.plugins.treesitter',
  require 'abdo.plugins.lint',
  require 'abdo.plugins.autopairs',
  require 'abdo.plugins.comments',
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
vim.cmd('Transparent' .. (vim.g.transparent_bg and 'Enable' or 'Disable'))
