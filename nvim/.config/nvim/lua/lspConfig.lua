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
lsp.gopls.setup({})
lsp.html.setup({})
lsp.jsonls.setup({})
lsp.lua_ls.setup({})
lsp.rust_analyzer.setup({})
lsp.tailwindcss.setup({})
lsp.ts_ls.setup({})
