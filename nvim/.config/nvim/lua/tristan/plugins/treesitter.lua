return{
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()

      local treesitter = require'nvim-treesitter'
      local filetypes = { 
        'markdown', 
        'bash', 
        'html', 
        'css', 
        'lua',
        'python'
      }

      treesitter.setup {
        -- Directory to install parsers and queries to
        install_dir = vim.fn.stdpath('data') .. '/site'
      }

      -- Install 
      treesitter.install(filetypes)

      -- Enable highlighting
      vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypes,
        callback = function() vim.treesitter.start() end,
      })

    end,
}
