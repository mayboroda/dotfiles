---@module 'snacks'
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Snacks find files" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Snacks live grep" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Snacks buffers" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Snacks help tags" },
    { "<leader>th", function() Snacks.picker.colorschemes() end, desc = "Select theme with preview" },
    { "<C-/>", function() Snacks.terminal.toggle() end, desc = "Toggle Snacks terminal" },
  },
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
    },
    terminal = {
      enabled = true,
    },
  }
}
