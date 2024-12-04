return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      local opts = {
        options = {
          theme = vim.g.colorscheme,
          component_separators = '',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_c = { 'filename' },
          lualine_x = {},
          lualine_y = { 'filetype' },
          lualine_z = { 'location' },
        },
      }
      local makeLuaLineTransparent = function()
        -- Use the vim.g.colorscheme to get the theme or use the default one if lualine.themes.<colorscheme> is not found
        local theme = nil
        if pcall(function()
          require('lualine.themes.' .. vim.g.colorscheme)
        end) then
          theme = require('lualine.themes.' .. vim.g.colorscheme)
        else
          theme = require 'lualine.themes.auto'
        end

        local lualine_modes = { 'insert', 'normal', 'visual', 'command', 'replace', 'inactive', 'terminal' }
        for _, field in ipairs(lualine_modes) do
          if theme[field] and theme[field].c then
            theme[field].c.bg = 'NONE'
          end
        end
        opts.options.theme = theme
      end
      if vim.g.transparent_bg then
        makeLuaLineTransparent()
      end
      require('lualine').setup(opts)
    end,
  },
}
