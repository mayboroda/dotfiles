return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
      require("oil").setup()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "pdf",
        callback = function()
          vim.fn.jobstart({"open", "-a", "Preview", vim.fn.expand("%")})
        end,
      })
    end
  }
}
