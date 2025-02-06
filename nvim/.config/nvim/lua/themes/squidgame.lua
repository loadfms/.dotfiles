local M = {}

M.setup = function()
    -- Define reusable color variables
    local colors = {
        black = "#080808",
        white = "#F8F8FF",
        primary = "#ed1b76",
        cursorline = "#81173C",
        secondary = "#f15599",
        func = "#f7a1c6",
        var = "#ffffff",
        const = "#ffffff",
        comment = "#5C5C5C",
        str = "#ffffff",
        error = "#ed1b76",
    }

    -- Apply highlights
    local highlights = {
        Normal = { fg = colors.white, bg = colors.black },
        Cursor = { fg = colors.black, bg = colors.white },
        CursorLine = { bg = colors.cursorline },
        CursorLineNr = { fg = colors.str, bg = colors.black },
        CursorColumn = { bg = colors.black },
        ColorColumn = { bg = colors.black },
        FoldColumn = { fg = colors.comment, bg = colors.black },
        SignColumn = { fg = colors.comment, bg = colors.black },
        LineNr = { fg = colors.white, bg = colors.black },
        VertSplit = { fg = colors.white, bg = colors.black },
        MatchParen = { fg = colors.error },
        StatusLine = { fg = colors.white, bg = colors.black, bold = true },
        Pmenu = { fg = colors.white, bg = colors.black },
        PmenuSel = { bg = colors.primary, fg = colors.black },
        IncSearch = { fg = colors.black, bg = colors.func },
        Search = { bg = colors.func, fg = colors.black },
        CurSearch = { bg = colors.primary, fg = colors.black },
        Directory = { fg = colors.const },
        Folded = { fg = colors.white, bg = colors.black },
        WildMenu = { fg = colors.str, bg = colors.black },
        Boolean = { fg = colors.const },
        Character = { fg = colors.const },
        Comment = { fg = colors.comment },
        Conditional = { fg = colors.primary },
        Constant = { fg = colors.const },
        Define = { fg = colors.primary },
        DiffAdd = { fg = colors.black, bg = colors.primary, bold = true },
        DiffDelete = { bg = colors.black },
        DiffChange = { bg = colors.func, fg = colors.white },
        DiffText = { fg = colors.white, bg = colors.primary, bold = true },
        ErrorMsg = { fg = colors.error, bg = colors.black, bold = true },
        WarningMsg = { fg = colors.white, bg = colors.error },
        Float = { fg = colors.const },
        Function = { fg = colors.func },
        Identifier = { fg = colors.secondary, italic = true },
        Keyword = { fg = colors.primary, bold = true },
        Label = { fg = colors.var },
        NonText = { fg = colors.comment, bg = colors.black },
        Number = { fg = colors.const },
        Operator = { fg = colors.primary },
        PreProc = { fg = colors.primary },
        Special = { fg = colors.white },
        SpecialKey = { fg = colors.white, bg = colors.black },
        Statement = { fg = colors.primary },
        StorageClass = { fg = colors.secondary, italic = true },
        String = { fg = colors.str },
        Tag = { fg = colors.primary },
        Title = { fg = colors.white, bold = true },
        Todo = { fg = colors.white, bold = true, reverse = true },
        Type = { fg = colors.secondary },
        Underlined = { underline = true },
        QuickFixLine = { bg = colors.primary },
        DiagnosticWarn = { fg = colors.error },
        DiagnosticError = { fg = colors.error, bg = colors.black },
        GitSignsAdd = { fg = colors.primary },
        GitSignsChange = { fg = colors.primary },
        GitSignsDelete = { fg = colors.primary },
    }

    -- Apply the highlight groups
    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end

    -- Terminal colors
    local terminal_colors = {
        [0] = colors.black,
        [1] = colors.error,
        [2] = colors.primary,
        [4] = colors.func,
        [7] = colors.str,
        [9] = colors.error,
        [11] = colors.var,
        [12] = colors.secondary,
        [13] = colors.const,
        [15] = colors.comment
    }

    for i, color in ipairs(terminal_colors) do
        vim.g["terminal_color_" .. (i - 1)] = color
    end
end

return M
