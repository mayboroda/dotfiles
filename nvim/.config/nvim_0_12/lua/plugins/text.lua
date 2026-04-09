vim.pack.add({
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
})

require('render-markdown').setup({
  html = { enabled = false },
  latex = { enabled = false },
  yaml = { enabled = false },
})

vim.keymap.set("n", "<leader>bw", function()
  local wrap = not vim.opt_local.wrap:get()
  vim.opt_local.wrap = wrap
  vim.opt_local.linebreak = wrap
  vim.opt_local.breakindent = wrap
end, { desc = "Toggle wrap + formatting (buffer)" })
