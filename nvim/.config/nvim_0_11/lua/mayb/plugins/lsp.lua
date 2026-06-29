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
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
        callback = function(event)
          local opts = { buffer = event.buf, silent = true }
          local map = vim.keymap.set

          -- LSP navigation
          map("n", "gd", vim.lsp.buf.declaration, opts)
          map("n", "gD", vim.lsp.buf.definition, opts)
          map("n", "gi", vim.lsp.buf.implementation, opts)
          map("n", "gr", vim.lsp.buf.references, opts)
          map("n", "K", vim.lsp.buf.hover, opts)

          -- Symbols
          map("n", "gds", vim.lsp.buf.document_symbol, opts)
          map("n", "gws", vim.lsp.buf.workspace_symbol, opts)

          -- Actions
          map("n", "<leader>rn", vim.lsp.buf.rename, opts)
          map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          map("n", "<leader>cl", vim.lsp.codelens.run, opts)
          map("n", "<leader>sh", vim.lsp.buf.signature_help, opts)
          map("n", "<leader>f", vim.lsp.buf.format, opts)

          -- Diagnostics (workspace)
          map("n", "<leader>aa", vim.diagnostic.setqflist, opts)
          map("n", "<leader>ae", function()
            vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
          end, opts)
          map("n", "<leader>aw", function()
            vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN })
          end, opts)

          -- Diagnostics (buffer)
          map("n", "<leader>d", vim.diagnostic.setloclist, opts)

          -- Diagnostic navigation
          map("n", "[c", function()
            vim.diagnostic.jump({count=-1, float=true})
          end, opts)
          map("n", "]c", function()
            vim.diagnostic.jump({ count=1, float=true })
          end, opts)
        end,
      })
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")
      -- Lua
      lspconfig.lua_ls.setup { capabilites = capabilities }
      -- Racket
      lspconfig.racket_langserver.setup { capabilites = capabilities }
      -- Clang
      lspconfig.clangd.setup { capabilites = capabilities }
      -- Bash
      lspconfig.bashls.setup { capabilites = capabilities }
      -- Deno
      lspconfig.denols.setup {
        capabilites = capabilities,
        root_dir = util.root_pattern("deno.json", "deno.jsonc"),
      }
      -- Typescript 
      lspconfig.ts_ls.setup {
        capabilites = capabilities,
        root_dir = util.root_pattern("package.json"),
        single_file_support = false,
      }

      -- Golang
      lspconfig.golangci_lint_ls.setup { capabilites = capabilities }

      -- Scala
      lspconfig.metals.setup {
        filetypes = { "scala", "sbt", "sc", "mill" },
        root_dir = util.root_pattern(
          "WORKSPACE",
          "WORKSPACE.bazel",
          "MODULE.bazel",
          "BUILD.bazel",
          "build.sbt",
          "project",
          ".git"
        ),

        -- IMPORTANT: cmd should be a LIST, especially with spaces in the path
        cmd = { vim.fn.expand("~/Library/Application Support/Coursier/bin/metals") },
      }

      -- Swift
      lspconfig.sourcekit.setup { capabilites = capabilities }
      -- Rust
      lspconfig.rust_analyzer.setup {
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
      lspconfig.bazelrc_lsp.setup {
        capabilities = capabilities,
      }
    end
  }
}
