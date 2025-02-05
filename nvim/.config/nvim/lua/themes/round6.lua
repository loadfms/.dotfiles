local M = {}

M.setup = function()
    -- Define reusable color variables
    local colors = {
        bg = "#080808",
        fg = "#ffffff",
        fg2 = "#ebebeb",
        fg3 = "#d6d6d6",
        fg4 = "#c2c2c2",
        bg2 = "#080808",
        bg3 = "#141414",
        bg4 = "#434343",
        keyword = "#ed1b76",
        builtin = "#f44786",
        const = "#ffffff",
        comment = "#c4d3dc",
        func = "#F7A1C6",
        str = "#ffffff",
        type = "#f15599",
        var = "#ffffff",
        warning = "#ed1b76",
        warning2 = "#f44786",
        cursorline = "#292929",
        red = "#ff0000",
    }

    -- Apply highlights
    local highlights = {
        Normal = { fg = colors.fg, bg = colors.bg },
        Cursor = { fg = colors.bg, bg = colors.fg },
        CursorLine = { bg = colors.cursorline },
        CursorLineNr = { fg = colors.str, bg = colors.bg },
        CursorColumn = { bg = colors.bg2 },
        ColorColumn = { bg = colors.bg3 },
        FoldColumn = { fg = colors.comment, bg = colors.bg2 },
        SignColumn = { fg = colors.comment, bg = colors.bg2 },
        LineNr = { fg = colors.fg2, bg = colors.bg2 },
        VertSplit = { fg = colors.fg3, bg = colors.bg3 },
        MatchParen = { fg = colors.warning2, underline = true },
        StatusLine = { fg = colors.fg2, bg = colors.bg3, bold = true },
        Pmenu = { fg = colors.fg, bg = colors.bg3 },
        PmenuSel = { bg = colors.keyword, fg = colors.bg },
        IncSearch = { fg = colors.bg, bg = colors.keyword },
        Search = { underline = true },
        Directory = { fg = colors.const },
        Folded = { fg = colors.fg4, bg = colors.bg },
        WildMenu = { fg = colors.str, bg = colors.bg },

        -- Define more highlight groups...

        Boolean = { fg = colors.const },
        Character = { fg = colors.const },
        Comment = { fg = colors.comment },
        Conditional = { fg = colors.keyword },
        Constant = { fg = colors.const },
        Define = { fg = colors.keyword },
        DiffAdd = { fg = "#fafafa", bg = "#123d0f", bold = true },
        DiffDelete = { bg = colors.bg2 },
        DiffChange = { bg = "#151b3c", fg = "#fafafa" },
        DiffText = { fg = "#ffffff", bg = "#ff0000", bold = true },
        ErrorMsg = { fg = colors.warning, bg = colors.bg2, bold = true },
        WarningMsg = { fg = colors.fg, bg = colors.warning2 },
        Float = { fg = colors.const },
        Function = { fg = colors.func },
        Identifier = { fg = colors.type, italic = true },
        Keyword = { fg = colors.keyword, bold = true },
        Label = { fg = colors.var },
        NonText = { fg = colors.bg4, bg = colors.bg2 },
        Number = { fg = colors.const },
        Operator = { fg = colors.keyword },
        PreProc = { fg = colors.keyword },
        Special = { fg = colors.fg },
        SpecialKey = { fg = colors.fg2, bg = colors.bg2 },
        Statement = { fg = colors.keyword },
        StorageClass = { fg = colors.type, italic = true },
        String = { fg = colors.str },
        Tag = { fg = colors.keyword },
        Title = { fg = colors.fg, bold = true },
        Todo = { fg = colors.fg2, bold = true, reverse = true },
        Type = { fg = colors.type },
        Underlined = { underline = true }
    }

    -- Apply the highlight groups
    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end

    -- Terminal colors
    local terminal_colors = {
        [0] = colors.bg,
        [1] = colors.warning,
        [2] = colors.keyword,
        [3] = colors.bg4,
        [4] = colors.func,
        [5] = colors.builtin,
        [6] = colors.fg3,
        [7] = colors.str,
        [8] = colors.bg2,
        [9] = colors.warning2,
        [10] = colors.fg2,
        [11] = colors.var,
        [12] = colors.type,
        [13] = colors.const,
        [14] = colors.fg4,
        [15] = colors.comment
    }

    for i, color in ipairs(terminal_colors) do
        vim.g["terminal_color_" .. (i - 1)] = color
    end
end

return M
