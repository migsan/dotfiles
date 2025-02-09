-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- lsp.lua
-- Import mason and mason-lspconfig
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {'ts_ls', 'lua_ls', 'eslint', 'html'}, -- Ensure the TypeScript Language Server is installed
})

-- Import lsp-zero module
local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)

-- Set up lsp-zero with defaults
lsp.setup()

-- Configure the TypeScript server specifically
require('lspconfig').ts_ls.setup{
  -- Add any ts_ls specific configurations here
  on_attach = function(client, bufnr)
    -- Example: Disable ts_ls's document formatting to use another formatter
    client.server_capabilities.document_formatting = false
  end,
}

