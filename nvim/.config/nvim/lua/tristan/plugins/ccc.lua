return {
  "uga-rosa/ccc.nvim", --color picker
  config = function()
    require('ccc').setup {
        highlighter = {
            auto_enable = true,
            lsp = true
        }
    }
  end
}


