return {
  {
    dir = "~/src/mayboroda/marko.nvim",
    config = function()
      require "marko"
    end
  },
  {
    dir = "~/src/mayboroda/languagetool.nvim",
    config = function()
      require("languagetool").setup({})
    end
  },
}
