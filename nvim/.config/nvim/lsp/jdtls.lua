local cwd = vim.fn.getcwd()
local home = os.getenv("HOME")
local lombok_path = home .. "/Downloads/lombok.jar"



-- Traverse upwards to find root marker
local function find_root()
    local root_markers = {
        "build.gradle", "settings.gradle", "pom.xml", ".git"
    }
    local path = cwd
    for _, marker in ipairs(root_markers) do
        local found = vim.fs.find(marker, { upward = true, path = path, type = "file" })
        if #found > 0 then
            return vim.fs.dirname(found[1])
        end
    end
    return cwd
end

return {
    cmd = {
        "jdtls",
        "--jvm-arg=-javaagent:" .. lombok_path,
    },
    filetypes = { "java" },
    root_dir = find_root(),
}
