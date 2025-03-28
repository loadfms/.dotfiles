local lsp = require('lspconfig')

-- completion options
vim.o.completeopt = "menu,noinsert,popup,fuzzy"

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


-- Remap Enter, Tab and Shift-Tab for navigation
local pumMaps = {
    ['<Tab>'] = '<C-n>',
    ['<S-Tab>'] = '<C-p>',
    ['<CR>'] = '<C-y>',
}
for insertKmap, pumKmap in pairs(pumMaps) do
    vim.keymap.set('i', insertKmap, function()
        return vim.fn.pumvisible() == 1 and pumKmap or insertKmap
    end, { expr = true })
end

-- Enable Ctrl-Space to manually trigger completion
vim.keymap.set('i', '<c-space>', function()
    vim.lsp.completion.get()
end)

-- Setup LSP servers
local servers = { "gopls", "html", "jsonls", "lua_ls", "rust_analyzer", "tailwindcss", "ts_ls", "pyright", "clangd" }

-- Function to enable LSP completion
local on_attach = function(client, bufnr)
    -- Ensure client exists
    if not client then return end

    -- Modify triggerCharacters for autocompletion
    if client.server_capabilities.completionProvider then
        client.server_capabilities.completionProvider.triggerCharacters =
            vim.split("qwertyuiopasdfghjklzxcvbnm. ", "")
    end

    -- Enable completion
    vim.lsp.completion.enable(true, client.id, bufnr, {
        autotrigger = true,
        convert = function(item)
            return { abbr = item.label:gsub('%b()', '') }
        end,
    })
end

for _, server in ipairs(servers) do
    lsp[server].setup({
        on_attach = on_attach,
    })
end
