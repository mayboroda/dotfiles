return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "vimdoc",
        "html",
        "json",
        "lua",
        -- "markdown",
        -- "markdown_inline",
        "python",
        "regex",
        "vim",
        "yaml",
        "go",
        "scala",
        "java",
        "rust",
      },
      -- Disable terraform treesitter on fixture files
      highlight = {
        enable = false,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    },
  },
}
