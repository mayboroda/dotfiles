vim.pack.add({
  {src='https://github.com/saghen/blink.cmp', version = 'v1'},
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/nvim-mini/mini.indentscope',
  'https://github.com/neovim/nvim-lspconfig',
})

-- Not sure I need this one
require('mini.indentscope').setup()


-- In case of warning try to build `:BlinkCmp:build`
require('blink.cmp').setup({
  keymap = { preset = 'default' },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono',
  },
  signature = { enabled = true },
})

-- Languages
-- TODO: Better structure for LSP ~/.config/nvim/lsp/lua_ls.lua
-- Lua
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
    },
  },
})
vim.lsp.enable('lua_ls')
-- Markdown PKM (Personal Knoledge Management)
vim.lsp.enable('markdown_oxide')

