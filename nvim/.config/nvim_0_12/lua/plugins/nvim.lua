vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-mini/mini.surround',
})

vim.cmd.packadd('cfilter')
vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')

require('mini.surround').setup()
