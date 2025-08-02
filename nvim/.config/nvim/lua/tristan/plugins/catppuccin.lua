return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true
        })
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
}
