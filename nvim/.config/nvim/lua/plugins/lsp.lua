
vim.pack.add {
	{ src = 'https://github.com/neovim/nvim-lspconfig'},
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
	{ src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
	{ src = 'https://github.com/saghen/blink.cmp' },
}

-- Prevent test from jumping.
vim.o.signcolumn = "yes"

-- List of languages for Mason to install
local	languages = {
		"lua_ls",
		"pyright",
		"html-lsp",
		"css-lsp",
		"clangd",
		"zls"
}

-- List of filetypes that are not attaching automatically on start
local filetypes = {
  'lua',
}

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local ft = vim.bo[bufnr].filetype
    for _, f in ipairs(filetypes) do
      if f == ft then
        vim.cmd("LspStart")
        break
      end
    end
  end,
})

require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
	ensure_installed = languages
})

-- Remove error marks in nvim config/plugin files
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

require('blink.cmp').setup({fuzzy = { implementation = "lua" }})

vim.opt.completeopt = { "menuone", "noselect", "popup" }
