vim.pack.add({
  {src='https://github.com/saghen/blink.cmp', version = 'v1'},
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/nvim-mini/mini.indentscope',
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
