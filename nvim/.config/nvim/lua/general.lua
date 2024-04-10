local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

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
