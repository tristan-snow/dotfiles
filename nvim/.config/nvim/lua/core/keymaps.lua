
-- map leader to ";"
vim.g.mapleader = ";"

-- clear search highlighting
vim.keymap.set("n", "<leader>l", ":nohlsearch<CR>:match<CR>:diffupdate<CR>", { desc = "Clear search highlighting", silent = true})

-- window management
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally"})
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically"})
-- Disabling for now, see if I ever use it. ;q seems to work just as well for this
-- vim.keymap.set("n", "<leader>sx", "<CMD>close<CR>", { desc = "Closes split"})

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
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- write and quit shortcuts
vim.keymap.set("n", "<leader>w", "<CMD>w<CR>", { desc = "Write buffer"})
vim.keymap.set("n", "<leader>wa", "<CMD>wall<CR>", { desc = "Write all buffers"})
vim.keymap.set("n", "<leader>wq", "<CMD>w<CR><CMD>q<CR>", { desc = "Write and quit buffer"})
vim.keymap.set("n", "<leader>W", "<CMD>wall<CR><CMD>qall<CR>", { desc = "Write and quit all buffers"})
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit buffer"})
vim.keymap.set("n", "<leader>d", "<CMD>bd<CR>", { desc = "Discard current buffer"})
vim.keymap.set("n", "<leader>Q", "<CMD>qall!<CR>", { desc = "Quit out of all, forcefully"})

-- alias x to d in visual mode
-- Again, disabling for now to see if I use it.
-- vim.keymap.set("v", "x", "d", { desc = "Delete in visual mode with x"})

