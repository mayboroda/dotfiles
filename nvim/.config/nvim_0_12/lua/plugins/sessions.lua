vim.pack.add({
  'https://github.com/nvim-mini/mini.sessions',
})

local sessions = require('mini.sessions')
sessions.setup({
  directory = vim.fn.stdpath("state") .. "/sessions",
})


vim.keymap.set('n', '<leader>ss', function()
  sessions.select()
end, { noremap = true, silent = true, desc = 'List all mini.Sessions' })


vim.keymap.set('n', '<leader>sw', function()
  sessions.write(sessions.get_latest(), {force = true})
end, { noremap = true, silent = true, desc = '(force) Write latest (currently openned) mini.Session' })

