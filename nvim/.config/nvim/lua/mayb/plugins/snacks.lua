return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
      layout = {
        preset = "bottom",
        layout = { height = 0.8, width = 0 },
      },
      win = {
        input = { border = "none" },
        list  = { border = "none" },
        preview = { border = "none" },
      },
    }
  }
}
