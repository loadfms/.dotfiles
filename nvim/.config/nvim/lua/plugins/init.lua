return {
    --theme
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },

    'nvim-lua/plenary.nvim',
    'tpope/vim-fugitive',
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'preservim/nerdcommenter',
    { 'stevearc/oil.nvim',               opts = {} },
    'nvim-tree/nvim-web-devicons',
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signs                        = {
                    add          = {
                        hl = 'GitSignsAdd',
                        text = '│',
                        numhl = 'GitSignsAddNr',
                        linehl = 'GitSignsAddLn'
                    },
                    change       = {
                        hl = 'GitSignsChange',
                        text = '│',
                        numhl = 'GitSignsChangeNr',
                        linehl = 'GitSignsChangeLn'
                    },
                    delete       = {
                        hl = 'GitSignsDelete',
                        text = '_',
                        numhl = 'GitSignsDeleteNr',
                        linehl = 'GitSignsDeleteLn'
                    },
                    topdelete    = {
                        hl = 'GitSignsDelete',
                        text = '‾',
                        numhl = 'GitSignsDeleteNr',
                        linehl = 'GitSignsDeleteLn'
                    },
                    changedelete = {
                        hl = 'GitSignsChange',
                        text = '~',
                        numhl = 'GitSignsChangeNr',
                        linehl = 'GitSignsChangeLn'
                    },
                    untracked    = {
                        hl = 'GitSignsAdd',
                        text = '┆',
                        numhl = 'GitSignsAddNr',
                        linehl = 'GitSignsAddLn'
                    },
                },
                signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
                numhl                        = true,  -- Toggle with `:Gitsigns toggle_numhl`
                linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir                 = {
                    interval = 1000,
                    follow_files = true
                },
                attach_to_untracked          = false,
                current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts      = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
                sign_priority                = 6,
                update_debounce              = 100,
                status_formatter             = nil,   -- Use default
                max_file_length              = 40000, -- Disable if file is longer than this (in lines)
                preview_config               = {
                    -- Options passed to nvim_open_win
                    border = 'single',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
                yadm                         = {
                    enable = false
                },
            }
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {},
                    always_divide_middle = false,
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', { 'diagnostics', always_visible = true } },
                    lualine_c = {
                        { 'buffers',
                            use_mode_colors = true, show_modified_status = false,
                            buffers_color = {
                                active = { fg = "#ffffff" }, -- color for active buffer
                            },
                            symbols = {
                                modified = ' ●', -- Text to show when the buffer is modified
                                alternate_file = ' ', -- Text to show to identify the alternate file
                                directory = '', -- Text to show when the buffer is a directory
                            }
                        }
                    },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = {}
            }
        end
    },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "go", "lua", "javascript", "html", "typescript", "css", "scss", "terraform", "tsx",
                    "bash" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = false,

                highlight = {
                    enable = true,

                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }
        end,
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
    },
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    "onsails/lspkind.nvim",
    {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup({
                progress = {

                    display = {
                        done_icon = "",
                        progress_icon = -- Icon shown when LSP progress tasks are in progress
                        { pattern = "grow_vertical", period = 1 },
                    },
                },
                notification = {
                    window = {
                        winblend = 0,
                    },
                },
            })
        end,
    },
    {
        'stevearc/conform.nvim',
        opts = {},
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    css = { { "prettier" } },
                    scss = { { "prettier" } },
                    go = { "goimports", "gofmt" },
                    rust = { "rustfmt" },
                },
                format_on_save = {
                    -- These options will be passed to conform.format()
                    timeout_ms = 5000,
                    lsp_fallback = true,
                },
            })
        end
    }
}
