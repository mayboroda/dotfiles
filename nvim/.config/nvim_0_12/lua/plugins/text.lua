vim.pack.add({
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
})

require('render-markdown').setup({
  html = { enabled = false },
  latex = { enabled = false },
  yaml = { enabled = false },
})

vim.keymap.set("n", "<leader>bw", function()
  local wrap = not vim.wo.wrap
  vim.opt_local.wrap = wrap
  vim.opt_local.linebreak = wrap
  vim.opt_local.breakindent = wrap
end, { desc = "Toggle wrap + formatting (buffer)" })

vim.api.nvim_create_user_command('Notes', function(opts)
  local file = opts.args ~= '' and opts.args or 'readme.md'
  local path = vim.fn.expand('~/notes/' .. file)

  vim.cmd.vsplit()
  vim.cmd.edit(path)

  -- disable wrap only in this window
  vim.wo.wrap = false
end, { nargs = '?' })
