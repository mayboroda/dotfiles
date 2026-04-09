vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-mini/mini.surround',
  'https://github.com/nvim-mini/mini.statusline',
  'https://github.com/nvim-mini/mini.icons',
})

vim.cmd.packadd('cfilter')
vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')

require('mini.icons').setup()
require('mini.statusline').setup()
require('mini.surround').setup()
