local M = {}

-- Set custom highlight for the statusline
-- vim.cmd [[
--   highlight StatusLine guibg=#282828 guifg=#ebdbb2
--   highlight ModeMsg gui=bold guifg=#1b1b1b guibg=#a9b665
-- ]]

-- Function to get the current mode and filetype icon
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
    local mode = vim.api.nvim_get_mode().mode
    return mode_map[mode] or "UNKNOWN"
end

M.get_filetype_icon = function()
    local ft = vim.bo.filetype
    local icon, _ = require('nvim-web-devicons').get_icon_by_filetype(ft, { default = true })
    return icon or ""
end

-- Function to set up the statusline
function M.setup()
    vim.o.statusline = table.concat({
        "%#ModeMsg# ", "%{v:lua.require'config.statusline'.get_mode()} ",
        "%#StatusLine# %f%{&modified ? ' ●' : ''}%{&readonly ? ' ' : ''}%{&buftype == 'nofile' ? ' 󰊠' : ''} ",
        "%=%#StatusLine# %{v:lua.require'config.statusline'.get_filetype_icon()} ",
        "%3l:%3c"
    })
end

return M
