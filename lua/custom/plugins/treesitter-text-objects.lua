return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  event = 'BufReadPost',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  init = function()
    vim.g.no_plugin_maps = true
  end,
  config = function()
    require('nvim-treesitter-textobjects').setup {
      select = { lookahead = true },
    }

    local select = require('nvim-treesitter-textobjects.select').select_textobject
    local map = function(lhs, query, desc)
      vim.keymap.set({ 'x', 'o' }, lhs, function()
        select(query)
      end, { desc = desc })
    end

    map('am', '@function.outer', 'method or function')
    map('im', '@function.inner', 'method or function')
    map('ac', '@class.outer', 'class')
    map('ic', '@class.inner', 'class')
    map('aa', '@parameter.outer', 'argument')
    map('ia', '@parameter.inner', 'argument')
  end,
}
