return {
    'nvim-lua/plenary.nvim',
    'tpope/vim-vinegar',
    'sainnhe/gruvbox-material',
    'tpope/vim-fugitive',
    'preservim/nerdcommenter',
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end
    },
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
                    always_divide_middle = true,
                    globalstatus = false,
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { { 'filename', path = 1 } },
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
        'nvim-telescope/telescope.nvim',
        config = function()
            local actions = require('telescope.actions')
            require('telescope').setup {
                defaults = {
                    layout_config = {
                        width = 0.75,
                        prompt_position = "bottom",
                        preview_cutoff = 120,
                        horizontal = { mirror = false },
                        vertical = { mirror = false }
                    },
                    find_command = {
                        'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
                    },
                    prompt_prefix = "󰅂 ",
                    selection_caret = "󰅂 ",
                    entry_prefix = "  ",
                    initial_mode = "insert",
                    selection_strategy = "reset",
                    sorting_strategy = "descending",
                    layout_strategy = "horizontal",
                    file_sorter = require 'telescope.sorters'.get_fuzzy_file,
                    file_ignore_patterns = {},
                    generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
                    path_display = {},
                    winblend = 0,
                    border = {},
                    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
                    color_devicons = true,
                    use_less = true,
                    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
                    file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
                    grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
                    qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
                    buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker,
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                            ["<esc>"] = actions.close,
                            ["<CR>"] = actions.select_default + actions.center,
                            ["<C-d>"] = actions.delete_buffer
                        },
                        n = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                            ["<C-d>"] = actions.delete_buffer
                        }
                    }
                }
            }
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "go", "lua", "javascript", "html", "typescript", "css", "scss", "terraform", "tsx" },

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
        "jose-elias-alvarez/null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "mason.nvim" },
        opts = function()
            local null_ls = require("null-ls")
            local formatting = null_ls.builtins.formatting
            return {
                sources = {
                    formatting.prettierd.with {
                        filetypes = { 'scss', 'css' },
                    },
                },
            }
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    "onsails/lspkind.nvim"
}
