return {
  {
    'zk-org/zk-nvim',
    config = function()
      require("zk").setup({
        picker = 'telescope',
      })
      local commands = require("zk.commands")
      print(commands)
      vim.keymap.set('n', '<leader>zn', commands.get('ZkNotes'), { desc = 'Zk notes' })
      vim.keymap.set('n', '<leader>zt', commands.get('ZkTags'), { desc = 'Zk tags' })
      vim.keymap.set('n', '<leader>zb', commands.get('ZkBuffers'), { desc = 'Zk buffers' })

      vim.keymap.set('n', '<leader>zlb', commands.get('ZkBacklinks'), { desc = 'Zk list backlinks' })
      vim.keymap.set('n', '<leader>zll', commands.get('ZkLinks'), { desc = 'Zk list links' })
      vim.keymap.set('v', '<leader>zil', commands.get('ZkInsertLink'), { desc = 'Zk insert link' })
    end
  }
}
