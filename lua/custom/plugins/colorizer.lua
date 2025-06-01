return {
  'norcalli/nvim-colorizer.lua',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('colorizer').setup({
      '*', -- enable for all filetypes
    }, {
      mode = 'background',
    })
  end,
}
