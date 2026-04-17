vim.pack.add({
  'https://github.com/stevearc/oil.nvim',
})

require('oil').setup({
  columns = { 'icon', 'size', 'mtime' },
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
  },
  keymaps = {
    ["<C-h>"] = false,
    ["<C-l>"] = false,
  }
})

