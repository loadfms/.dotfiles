local lsp = require('lspconfig')

--add borders to floating windows
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = "rounded"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- add icons to diagnostics
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
