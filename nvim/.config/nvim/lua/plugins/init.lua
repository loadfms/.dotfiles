return {
    -- Theme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- Copilot (AI suggestions)
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            local copilot = require("copilot")

            -- Get the built-in accept function
            local accept_fn = require("copilot.suggestion").accept

            -- Create a wrapper that accepts then inserts a newline
            local function accept_and_newline()
                accept_fn()
                -- Schedule the newline to avoid interfering with the accept behavior
                vim.schedule(function()
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "n", false)
                end)
            end

            copilot.setup({
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

            -- Override the default <C-j> mapping
            vim.keymap.set("i", "<C-j>", accept_and_newline, { desc = "Copilot Accept + Newline" })
        end,
    },

    -- Git Integration
    {
        'tpope/vim-fugitive',
        cmd = { 'G', 'Git', 'Gdiffsplit', 'Gvdiffsplit' }, -- lazy-load on Git commands }, -- make sure these are registered
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
                border   = "single",
                preview  = {
                    border = "single",
                },
                backdrop = 100,
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
    {
        'saghen/blink.cmp',
        event = "InsertEnter", -- Load when entering Insert mode
        version = '*',
        opts = {
            cmdline = {
                keymap = {
                    preset = 'enter', -- preset for enter-based completion acceptance
                    ['<Tab>'] = { 'select_next', 'fallback' },
                    ['<S-Tab>'] = { 'select_prev', 'fallback' },
                    ['<C-Space>'] = { 'show', 'fallback' }, -- explicitly trigger completion if not visible
                },
            },
            keymap = {
                preset = 'enter',
                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
                ['<Up>'] = { 'snippet_backward', 'fallback' },
                ['<Down>'] = { 'snippet_forward', 'fallback' },
                ['<C-Space>'] = { 'show', 'fallback' }, -- same here for general completion
                ['<Enter>'] = { 'accept', 'fallback' }, -- ensure enter directly accepts
            },

            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = 'mono',
            },

            completion = {
                menu = {
                    auto_show = true,
                    draw = {
                        columns = {
                            { "label",     "label_description", gap = 1 },
                            { "kind_icon", "kind",              gap = 2 },
                        },
                    },
                },
                documentation = {
                    window = {
                        border = "rounded",
                        winblend = 0,
                        max_width = 80,  -- limit max width of the documentation window for better readability
                        max_height = 20, -- limit max height for documentation window
                    },
                },
            },

            signature = {
                enabled = true,
                window = {
                    border = "rounded",
                    winblend = 0,
                },
            },

            sources = {
                default = { 'lsp', 'path', 'buffer' },
                providers = {},
            },
        },
        opts_extend = { "sources.default" }
    }
}
