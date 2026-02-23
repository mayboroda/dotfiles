vim.g.mapleader = " "

-- Expolore directory: show files
vim.keymap.set("n", "<leader>sf", ":Oil<CR>")

-- in case you select text and paste on top your copy-buffer will remain
vim.keymap.set("x", "p", [["_dP]])

-- indent and stay in visual mode
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Buffer navigation
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")

-- Simplification of splits movements
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- In terminal switch to a Normal mode
vim.keymap.set("n", "<leader>t/", function()
  vim.cmd("below terminal")
  vim.cmd("setlocal nonumber norelativenumber")
end, { desc = "Terminal vertical split" })
vim.api.nvim_set_keymap('t', '<C-;>', '<C-\\><C-n>', { noremap = true, silent = true })

-- LSP
vim.keymap.set({ "n", "i" }, "<S-CR>", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostics float" })
