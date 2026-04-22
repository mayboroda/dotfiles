-- To normal mode in Terminal
vim.api.nvim_set_keymap('t', '<C-;>', '<C-\\><C-n>', { noremap = true, silent = true })

-- `opts.range` is used to open `Opencode` on the left from the current tab using `:-Opencode`
vim.api.nvim_create_user_command("Opencode", function(opts)
  local prefix = opts.range == 1 and "-" or ""
  vim.cmd(prefix .. "tabnew")
  vim.cmd("terminal opencode")
  vim.cmd("startinsert")
end, { range = true })

-- I need to run `npm --version` just to start a nodejs in zsh
vim.api.nvim_create_user_command("Pi", function(opts)
  local prefix = opts.range == 1 and "-" or ""

  vim.cmd(prefix .. "tabnew")
  vim.cmd("terminal")

  local job_id = vim.b.terminal_job_id
  if job_id then
    vim.fn.chansend(job_id, "nvm use v24.14.0 && pi\n")
  end

  vim.cmd("startinsert")
end, { range = true })

