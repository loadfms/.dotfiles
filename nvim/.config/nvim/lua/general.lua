local g = vim.g
local opt = vim.opt
local lsp = vim.lsp

g.mapleader = ' '
g.netrw_fastbrowse = 0

-- General
opt.compatible = false
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.backup = false
opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 240
opt.mouse = ''

-- Editor
opt.number = true
opt.wrap = false
opt.signcolumn = 'yes'
opt.showmatch = true
opt.showmode = false
opt.foldmethod = 'marker'
opt.splitright = true
opt.splitbelow = false
opt.conceallevel = 0
opt.colorcolumn = '120'
opt.cursorline = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.shortmess:append { c = true }
opt.ignorecase = true
opt.smartcase = true
opt.relativenumber = true
opt.scrolloff = 9999
opt.guicursor = ""
opt.termguicolors = true
opt.fillchars = { eob = " " }
opt.foldlevel = 99


local make_client_capabilities = lsp.protocol.make_client_capabilities
function lsp.protocol.make_client_capabilities()
    local caps = make_client_capabilities()
    if not (caps.workspace or {}).didChangeWatchedFiles then
        vim.notify(
            'lsp capability didChangeWatchedFiles is already disabled',
            vim.log.levels.WARN
        )
    else
        caps.workspace.didChangeWatchedFiles = nil
    end

    return caps
end
