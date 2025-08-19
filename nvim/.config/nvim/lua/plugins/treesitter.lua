
vim.pack.add({
	{src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main'},
})

-- Local for clarity
local treesitter = require('nvim-treesitter')

-- Setup
treesitter.setup({
  -- Directory to install parsers and queries to
  install_dir = vim.fn.stdpath('data') .. '/site',
  highlight = { enable = true, }
})

-- Languages to install
local filetypes = {
  'zig',
  'c',
  'markdown',
  'bash',
  'html',
  'css',
  'lua',
  'python'
}

treesitter.install(filetypes)

-- Enable highlighting
vim.api.nvim_create_autocmd('FileType', {
  pattern = filetypes,
  callback = function() vim.treesitter.start() end,
})
