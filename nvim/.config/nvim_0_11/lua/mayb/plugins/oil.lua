return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
      require("oil").setup({
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
        } })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "pdf",
        callback = function()
          vim.fn.jobstart({"open", "-a", "Preview", vim.fn.expand("%")})
        end,
      })
    end
  }
}
