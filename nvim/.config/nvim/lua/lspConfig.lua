local lsp = require('lspconfig')

-- add customization to diagnostics
vim.diagnostic.config({
    float = { border = "solid" },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.HINT] = '󱠂',
            [vim.diagnostic.severity.INFO] = '󰋼',
        },
    },
})

-- Setup LSP servers
local servers = { "gopls", "html", "jsonls", "lua_ls", "rust_analyzer", "tailwindcss", "ts_ls", "pyright", "clangd" }

for _, server in ipairs(servers) do
    lsp[server].setup({})
end
