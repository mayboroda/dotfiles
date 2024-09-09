vim.g.mapleader = " "

-- remove header text in directory explorer (:Ex)
vim.g.netrw_banner = 0

-- Expolore directory: show files
vim.keymap.set("n", "<leader>sf", ":Ex<CR>")

-- in case you select text and paste on top your copy-buffer will remain
vim.keymap.set("x", "p", [["_dP]])

-- indent and stay in visual mode
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Simplification of splits movements
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- In terminal switch to a Normal mode
vim.api.nvim_set_keymap('t', '<C-;>', '<C-\\><C-n>', { noremap = true, silent = true })




