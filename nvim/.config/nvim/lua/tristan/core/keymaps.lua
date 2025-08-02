-- map leader to ";"
vim.g.mapleader = ";"

-- clear search highlighting
vim.keymap.set("n", "<leader>l", ":nohlsearch<CR>:match<CR>:diffupdate<CR>", { desc = "Clear search highlighting", silent = true})

-- window management
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally"})
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically"})
vim.keymap.set("n", "<leader>sx", "<CMD>close<CR>", { desc = "Closes split"})

-- window movement
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move right a window"})
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move down a window"})
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move up a window"})
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move left a window"})

-- buffer navigation
vim.keymap.set("n", "<leader>b", ":buffers<CR>:buffer<Space>", { desc = "Show buffer list and prompt buffer number"})

-- movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center after scroll down"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center after scroll down"})

-- write and quit shortcuts
vim.keymap.set("n", "<leader>w", "<CMD>wall<CR>", { desc = "Write all buffers"})
vim.keymap.set("n", "<leader>W", "<CMD>wall<CR><CMD>q<CR>", { desc = "Write and quit all buffers"})
vim.keymap.set("n", "<leader>q", "<CMD>qall<CR>", { desc = "Quit all buffers"})
vim.keymap.set("n", "<leader>d", "<CMD>bd<CR>", { desc = "Discard current buffer"})
vim.keymap.set("n", "<leader>Q", "<CMD>qall!<CR>", { desc = "Quit out of all, forcefully"})

-- alias x to d in visual mode
vim.keymap.set("v", "x", "d", { desc = "Delete in visual mode with x"})

