return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    local ok, _ = pcall(vim.cmd, "colorscheme rose-pine-moon")
    if not ok then
      print("colorscheme is not correct")
    end
  end,
}
