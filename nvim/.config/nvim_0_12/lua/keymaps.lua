vim.g.mapleader = ' '

-- Expolore directory: show files
vim.keymap.set('n', '<leader>sf', ':Oil<CR>')

-- in case you select text and paste on top your copy-buffer will remain
-- vim.keymap.set("x", "p", [["_dP]])

-- indent and stay in visual mode
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Buffer navigation
vim.keymap.set('n', '<Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>')


-- To normal mode in Terminal
vim.api.nvim_set_keymap('t', '<C-;>', '<C-\\><C-n>', { noremap = true, silent = true })
