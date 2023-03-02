local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/load/workspace/java/workspaces' .. project_name
local jdtlsLocation = '/usr/bin/jdtls'

if vim.loop.os_uname().sysname == "Darwin" then
    workspace_dir = '/Users/lesilva/workspace/java/workspaces' .. project_name
    jdtlsLocation = '/usr/local/bin/jdtls'
end


local config = {
    cmd = { jdtlsLocation, '-data', workspace_dir },
    root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}

require('jdtls').start_or_attach(config)
