local M = {}

-- Set custom highlight for the statusline
vim.cmd [[
  highlight StatusLine guibg=#282828 guifg=#ebdbb2
  highlight ModeMsg gui=bold guifg=#1b1b1b guibg=#a9b665
]]

M.get_mode = function()
    local mode_map = {
        n = "NORMAL",
        i = "INSERT",
        v = "VISUAL",
        V = "V-LINE",
        [""] = "V-BLOCK",
        c = "COMMAND",
        s = "SELECT"
    }
    return mode_map[vim.api.nvim_get_mode().mode] or "UNKNOWN"
end

-- M.get_git_branch = function()
--     local branch = vim.fn.systemlist("git branch --show-current 2>/dev/null")[1]
--     local icon = "  "
--     return branch and #branch > 0 and (icon .. branch) or "No Git"
-- end

function M.setup()
    vim.o.statusline = table.concat({
        "%#ModeMsg# ", "%{v:lua.require'config.statusline'.get_mode()} ",

        -- "%#StatusLine# ", "%{v:lua.require'statusline'.get_git_branch()} ",
        "%#StatusLine# %f%{&modified ? ' ●' : ''}%{&readonly ? ' ' : ''}%{&buftype == 'nofile' ? ' 󰊠' : ''} ",
        "%=%#StatusLine# [%{&fileencoding}] [%{&fileformat}] %y ",

        "%3l:%3c"
    })
end

return M
