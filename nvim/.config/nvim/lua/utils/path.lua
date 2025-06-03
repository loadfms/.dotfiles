local M = {}

---Finds the root directory based on marker files
---@param root_markers string[]
---@param fallback_path string? Defaults to cwd
---@return string
function M.find_root(root_markers, fallback_path)
    local path = fallback_path or vim.fs.dirname(vim.api.nvim_buf_get_name(0))

    for _, marker in ipairs(root_markers) do
        local found = vim.fs.find(marker, { upward = true, path = path, type = "file" })
        if #found > 0 then
            return vim.fs.dirname(found[1])
        end
    end

    return fallback_path or vim.loop.cwd()
end

return M
