
vim.pack.add({
	{src = 'https://github.com/echasnovski/mini.nvim' },
})

require('mini.starter').setup()
require('mini.tabline').setup()
require('mini.statusline').setup()
require('mini.icons').setup()
require('mini.bracketed').setup()

-- Mini Files
require('mini.files').setup()
vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<cr>', {desc = 'File explorer'})

-- Mini Pick
require('mini.pick').setup()
vim.keymap.set('n', '<leader>f', '<cmd>Pick files<CR>', {desc = 'Pick files'})

-- Mini Jump
require('mini.jump').setup({
  mappings = {
      repeat_jump = ' ',
    },
  }
)
