local lsp = require('lspconfig')

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {
        border = "rounded",
    }
)

vim.diagnostic.config({
    float = { border = "rounded" },
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
lsp.gopls.setup({})
lsp.html.setup({})
lsp.jsonls.setup({})
lsp.lua_ls.setup({})
lsp.rust_analyzer.setup({})
lsp.tailwindcss.setup({})
