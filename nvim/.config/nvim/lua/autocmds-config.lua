vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.lua", "*.html", "*.rs", "*.tsx", "*.ts", "*.json" },
    command = ":lua vim.lsp.buf.format()",
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.js", "*.jsx", "*.vue" },
    command = ":EslintFixAll",
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go" },
    callback = function()
        local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
        params.context = { only = { "source.organizeImports" } }

        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        for _, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
                else
                    vim.lsp.buf.execute_command(r.command)
                end
            end
        end

        vim.lsp.buf.format()
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.java" },
    callback = function()
        require 'jdtls'.organize_imports()
        vim.lsp.buf.format()
    end
})
