local lsp = vim.lsp
local o = vim.o
local diagnostic = vim.diagnostic
local api = vim.api

lsp.enable('clangd')
lsp.enable('gopls')
lsp.enable('html')
lsp.enable('jsonls')
lsp.enable('luals')
lsp.enable('pyright')
lsp.enable('rust_analyzer')
lsp.enable('tailwindcss')
lsp.enable('ts_ls')

-- completion options
o.completeopt = "menu,noinsert,popup,fuzzy"

diagnostic.config({
    float = { border = "solid" },
    signs = {
        text = {
            [diagnostic.severity.ERROR] = '',
            [diagnostic.severity.WARN] = '',
            [diagnostic.severity.HINT] = '󱠂',
            [diagnostic.severity.INFO] = '󰋼',
        },
    },
})

-- Autocommand to run when LSP attaches to a buffer
api.nvim_create_autocmd('LspAttach', {
    group = api.nvim_create_augroup('user.lsp', { clear = true }),
    callback = function(args)
        local client = lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf

        -- Sanity check
        if not client then return end

        -- Custom trigger characters for completion
        if client.server_capabilities.completionProvider then
            client.server_capabilities.completionProvider.triggerCharacters =
                vim.split("qwertyuiopasdfghjklzxcvbnm. ", "")
        end

        -- Enable completion
        lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true,
            convert = function(item)
                return { abbr = item.label:gsub('%b()', '') }
            end,
        })
    end
})

-- Remap Enter, Tab, and Shift-Tab for popup menu navigation
local pumMaps = {
    ['<Tab>'] = '<C-n>',
    ['<S-Tab>'] = '<C-p>',
    ['<CR>'] = '<C-y>',
}

for insertKmap, pumKmap in pairs(pumMaps) do
    vim.keymap.set('i', insertKmap, function()
        return vim.fn.pumvisible() == 1 and pumKmap or insertKmap
    end, { expr = true, silent = true })
end

-- Use <C-Space> to manually trigger completion
vim.keymap.set('i', '<C-Space>', function()
    if vim.fn.pumvisible() == 0 then
        vim.fn.feedkeys(api.nvim_replace_termcodes('<C-x><C-o>', true, true, true), 'n')
    end
end, { silent = true })
