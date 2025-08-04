
--Neovim vim.options--

-- Turn on foldcolumn
vim.opt.foldcolumn = "1"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Turn on guicolors
vim.opt.termguicolors = true

-- line numbers
vim.opt.number = true
-- vim.opt.relativenumber = true

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- use system clipboard as default register
vim.opt.clipboard:append("unnamedplus") 

--search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- turn off swapfile
vim.opt.swapfile = false

-- turn off line wrapping
vim.opt.wrap = false

-- split windows
vim.opt.splitright = true -- split vertical windows to the right
vim.opt.splitbelow = true -- split horzontal windows to the bottom

-- persistent undofile
vim.opt.undofile = true 

-- Enable syntax
vim.cmd('syntax enable')
