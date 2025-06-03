local lsp = vim.lsp
local diagnostic = vim.diagnostic

lsp.enable({
    'clangd',
    'gopls',
    'html',
    'jsonls',
    'luals',
    'pyright',
    'rust_analyzer',
    'tailwindcss',
    'ts_ls',
    'jdtls'
})

-- Diagnostic configuration
diagnostic.config({
    virtual_lines = false,
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { border = "solid" },
    signs = {
        text = {
            [diagnostic.severity.ERROR] = "󰅚 ",
            [diagnostic.severity.WARN] = "󰀪 ",
            [diagnostic.severity.INFO] = "󰋽 ",
            [diagnostic.severity.HINT] = "󰌶 ",
        },
    },
})

-- FLoating window configuration
-- "bold": Bold line box.
-- "double": Double-line box.
-- "none": No border.
-- "rounded": Like "single", but with rounded corners ("╭" etc.).
-- "shadow": Drop shadow effect, by blending with the background.
-- "single": Single-line box.
-- "solid": Adds padding by a single whitespace cell.
lsp.util.open_floating_preview = (function(orig)
    return function(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = "solid"
        return orig(contents, syntax, opts, ...)
    end
end)(lsp.util.open_floating_preview)
