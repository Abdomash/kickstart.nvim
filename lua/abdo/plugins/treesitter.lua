return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = {
      'lua',
      'c',
      'cpp',
      'diff',
      'typescript',
      'javascript',
      'python',
      'html',
      'bash',
      'vim',
      'rust',
      'json',
      'markdown',
      'markdown_inline',
      'vimdoc',
      'luadoc',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}
