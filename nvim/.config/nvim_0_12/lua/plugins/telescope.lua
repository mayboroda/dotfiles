vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim', -- this is a telescop dependency
  'https://github.com/nvim-telescope/telescope.nvim',
})

local action_layout = require('telescope.actions.layout')
require('telescope').setup({
  defaults = {
    mappings = {
      n = {
        ["<M-p>"] = action_layout.toggle_preview
      },
      i = {
        ["<M-p>"] = action_layout.toggle_preview
      },
    },
    layout_strategy = "bottom_pane",
    layout_config = {
      prompt_position = "top",
      height = 0.5,
      preview_width = 0.6,
    },
    sorting_strategy = "ascending",
    border = false,
    -- makes it feel more like a list than a "search UI"
    results_title = false,
    preview_title = false,
    prompt_title = true,
  },
  pickers = {
    find_files = {
      hidden = true,
      find_command = {"fd", "--type", "f", "--hidden", "--no-ignore", "--exclude", ".git" },
    },
    live_grep = {
      additional_args = function()
        return { "--hidden", "--no-ignore", "--glob", "!.git/*"}
      end
    }
  }
})

-- vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<CR>', {desc = 'List buffers'})
-- vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<CR>', {desc = 'Find files'})
