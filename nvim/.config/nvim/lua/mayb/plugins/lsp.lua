return {
  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      -- Lua
      require('lspconfig').lua_ls.setup { capabilites = capabilities }
      -- Racket
      require('lspconfig').racket_langserver.setup { capabilites = capabilities }
      -- Clang
      require('lspconfig').clangd.setup {}
      -- Bash
      require('lspconfig').bashls.setup {}
      -- Deno
      require('lspconfig').denols.setup {}

    end
  }
}
