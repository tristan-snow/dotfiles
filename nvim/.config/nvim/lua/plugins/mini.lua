
vim.pack.add({
	{src = 'https://github.com/echasnovski/mini.nvim' },
})

require('mini.starter').setup()
require('mini.tabline').setup()
require('mini.statusline').setup()
require('mini.icons').setup()
require('mini.bracketed').setup()
require('mini.extra').setup()

-- Mini Files
require('mini.files').setup({mappings = { go_in_plus = '<Enter>'}})

-- Mini Pick
require('mini.pick').setup()

-- Mini Jump
require('mini.jump').setup({
  mappings = {
      repeat_jump = ' ',
    },
  }
)

vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<cr>', {desc = 'File explorer'})
vim.keymap.set('n', '<leader>f', '<cmd>Pick files<cr>', {desc = 'Pick files'})
