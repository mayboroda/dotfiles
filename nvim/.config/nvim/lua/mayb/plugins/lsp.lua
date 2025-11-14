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
      require('lspconfig').clangd.setup { capabilites = capabilities }
      -- Bash
      require('lspconfig').bashls.setup { capabilites = capabilities }
      -- Deno
      require('lspconfig').denols.setup { capabilites = capabilities }
      -- Golang
      require('lspconfig').golangci_lint_ls.setup { capabilites = capabilities }
      -- Scala
      require('lspconfig').metals.setup {
        filetypes = { "scala", "sbt", "sc", "mill" }
      }
      -- Swift
      require('lspconfig').sourcekit.setup { capabilites = capabilities }
      -- Rust
      require('lspconfig').rust_analyzer.setup {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = true,
            check = {
              command = "clippy", -- run `cargo clippy` instead of plain `check`
            },
          },
        },
      }
    end
  }
}
