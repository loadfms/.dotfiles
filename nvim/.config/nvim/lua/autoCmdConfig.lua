--vim.api.nvim_create_autocmd("BufWritePre", {
--pattern = { "*.lua", "*.html", "*.rs", "*.tsx", "*.ts", "*.json", "*.scss", "*.js", "*.jsx", "*.vue" },
--command = ":lua vim.lsp.buf.format()",
--})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.java" },
    callback = function()
        require 'jdtls'.organize_imports()
        vim.lsp.buf.format()
    end
})
