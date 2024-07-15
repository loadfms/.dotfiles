local lsp = vim.lsp

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        -- Create your keybindings here...
    end
})

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'gopls',
        'html',
        'jsonls',
        'lua_ls',
        'rust_analyzer',
        'tailwindcss',
        'tsserver',
    }
})

local lspconfig = require('lspconfig')
-- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            -- capabilities = lsp_capabilities,
        })
    end,
})

--local signs = {
--Error = " ",
--Warn = "",
--Hint = "󱠂 ",
--Information = "󰋼 "
--}

--for type, icon in pairs(signs) do
--local hl = "DiagnosticSign" .. type
--vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
--end
--

lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    width = 100
})
