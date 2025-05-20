local function find_tailwind_root()
    local root_markers = {
        "tailwind.config.js",
        "tailwind.config.ts",
        "postcss.config.js",
        "package.json",
        ".git",
    }

    local path = vim.api.nvim_buf_get_name(0)
    path = vim.fs.dirname(path)

    for _, marker in ipairs(root_markers) do
        local found = vim.fs.find(marker, { upward = true, path = path, type = "file" })
        if #found > 0 then
            return vim.fs.dirname(found[1])
        end
    end

    return path
end

return {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    filetypes = { 'html', 'typescript', 'typescriptreact', 'tsx', 'css', 'scss', 'less', 'vue' },
    root_dir = find_tailwind_root(),
}
