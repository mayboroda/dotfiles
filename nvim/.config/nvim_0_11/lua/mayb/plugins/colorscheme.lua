return {
  {
    "folke/tokyonight.nvim",
    config = function()
      -- vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      -- VimCmd('colorscheme rose-pine-moon')
    end
  }
}
