
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Remove line numbers in the terminal',
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0
  end,
})


