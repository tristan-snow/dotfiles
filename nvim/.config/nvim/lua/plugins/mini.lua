vim.pack.add({
	{src = "https://github.com/echasnovski/mini.nvim" },
})

require('mini.starter').setup()
require('mini.tabline').setup()
require('mini.statusline').setup()
require('mini.icons').setup()
require('mini.bracketed').setup()

-- Mini Files
require('mini.files').setup()

-- Mini Pick
require('mini.pick').setup()
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")

-- Mini Jump
require('mini.jump').setup({
  mappings = {
      repeat_jump = ' ',
    },
  }
)
