vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-mini/mini.surround',
  'https://github.com/nvim-mini/mini.statusline',
  'https://github.com/nvim-mini/mini.icons',
  'https://github.com/nvim-mini/mini.pick',
})

vim.cmd.packadd('cfilter')
vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')

require('mini.icons').setup()
require('mini.statusline').setup()
require('mini.surround').setup()
require('mini.pick').setup()

vim.keymap.set('n', '<leader>b', '<cmd>Pick buffers<CR>', {desc = 'List buffers'})
vim.keymap.set('n', '<leader>f', '<cmd>Pick files<CR>', {desc = 'Find files'})
vim.keymap.set('n', '<leader>g', '<cmd>Pick grep_live<CR>', {desc = 'Grep files'})


