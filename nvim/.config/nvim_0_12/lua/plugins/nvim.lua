vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-mini/mini.surround',
  'https://github.com/nvim-mini/mini.statusline',
  'https://github.com/nvim-mini/mini.icons',
  'https://github.com/nvim-lua/plenary.nvim', -- this is a telescop dependency
  'https://github.com/nvim-telescope/telescope.nvim',
})

vim.cmd.packadd('cfilter')
vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')

require('mini.icons').setup()
require('mini.statusline').setup()
require('mini.surround').setup()

require('telescope').setup({
  defaults = {
    layout_strategy = "bottom_pane",
    layout_config = {
      prompt_position = "top",
      height = 0.5,
      preview_width = 0.6,
    },
    sorting_strategy = "ascending",
    border = false,
    -- makes it feel more like a list than a "search UI"
    results_title = false,
    preview_title = false,
    prompt_title = true,
  },
})
