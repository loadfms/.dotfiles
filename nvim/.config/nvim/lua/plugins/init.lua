return {
    -- Theme
    { "sainnhe/gruvbox-material" },

    -- Copilot (AI suggestions)
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    hide_during_completion = false,
                    keymap = {
                        accept = "<C-j>",
                        accept_word = false,
                        accept_line = false,
                    },
                },
            })
        end,
    },

    -- Git Integration
    {
        'tpope/vim-fugitive',
        cmd = { 'G', 'Git' }, -- make sure these are registered
    },
    {
        'lewis6991/gitsigns.nvim',
        cmd = "Git",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs                        = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '-' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl                        = true,  -- Toggle with `:Gitsigns toggle_numhl`
            linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir                 = {
                follow_files = true
            },
            auto_attach                  = true,
            attach_to_untracked          = false,
            current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts      = {
                virt_text = false,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
            },
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            sign_priority                = 6,
            update_debounce              = 100,
            status_formatter             = nil,   -- Use default
            max_file_length              = 40000, -- Disable if file is longer than this (in lines)
            preview_config               = {
                -- Options passed to nvim_open_win
                border = 'rounded',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
        }
    },

    -- File Navigation / UI
    {
        'stevearc/oil.nvim',
        cmd = "Oil",
        opts = {}
    },
    {
        "ibhagwan/fzf-lua",
        cmd = "FzfLua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            winopts    = {
                border  = "single",
                preview = {
                    border = "single",
                },
            },
            files      = {
                rg_opts = [[--files --hidden --glob !.git --glob !node_modules]]
            },
            grep       = {
                rg_opts =
                "--color=never --no-heading --with-filename --line-number --column --smart-case --glob !node_modules",
            },
            previewers = {
                builtin = {

                    syntax_limit_b = 1024 * 100, -- 100KB
                    extensions = {
                        ["jpg"] = { "chafa", "{file}" },
                    },
                }
            }
        }
    },

    -- Treesitter (Syntax highlighting, etc.)
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPost", "BufNewFile" },
        build = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "go", "lua" },

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

    -- LSP
    -- { 'neovim/nvim-lspconfig',   event = "BufReadPre" },

    -- Formatter
    {
        'stevearc/conform.nvim',

        event = "BufWritePre",
        opts = {},
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    javascript = { "prettier", stop_after_first = true },
                    scss = { "prettier", stop_after_first = true },
                    typescriptreact = { "prettier", stop_after_first = true },
                    go = { "goimports", "gofmt" },
                    rust = { "rustfmt" },
                    python = { "black" },
                    cpp = { "clang-formatter" },
                },
                format_on_save = {
                    lsp_format = "fallback",
                    timeout_ms = 5000,
                },
            })
        end
    },
}
