return {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'BufReadPost',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesitter-context').setup {
      throttle = true, -- better performance
    }
  end,
}
