return {
    --theme
    { "sainnhe/gruvbox-material" },
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
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
    {
        'tpope/vim-fugitive',
    },
    {
        'stevearc/oil.nvim',
        opts = {}
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
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
        end
    },
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            previewers = {
                builtin = {
                    syntax_limit_b = 1024 * 100, -- 100KB
                },
            },
        },
        config = function()
            require("fzf-lua").setup({
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
                        extensions = {
                            ["jpg"] = { "chafa", "{file}" },
                        },
                    }
                }
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "go", "lua", "javascript", "html", "typescript", "css", "scss", "tsx" },

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
    { 'neovim/nvim-lspconfig' },
    {
        'stevearc/conform.nvim',
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
                    -- These options will be passed to conform.format()
                    lsp_format = "fallback",
                    timeout_ms = 5000,
                },
            })
        end
    },
    {
        "sphamba/smear-cursor.nvim",
        opts = {},
    },
}

--temporary removed
-- Blink - using the default autcomplete available on nvim 0.11
--
-- {
--     "giuxtaposition/blink-cmp-copilot",
-- },
-- {
--     'saghen/blink.cmp',
--     -- optional: provides snippets for the snippet source
--     dependencies = 'rafamadriz/friendly-snippets',
--
--     -- use a release tag to download pre-built binaries
--     version = '*',
--     -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
--     -- build = 'cargo build --release',
--     -- If you use nix, you can build from source using latest nightly rust with:
--     -- build = 'nix run .#build-plugin',
--
--     ---@module 'blink.cmp'
--     ---@type blink.cmp.Config
--     opts = {
--         -- 'default' for mappings similar to built-in completion
--         -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
--         -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
--         -- See the full "keymap" documentation for information on defining your own keymap.
--         cmdline = {
--             keymap = {
--                 preset = 'enter',
--                 -- ['<CR>'] = { 'accept_and_enter', 'fallback' },
--                 ['<Tab>'] = { 'select_next', 'fallback' },
--                 ['<S-Tab>'] = { 'select_prev', 'fallback' },
--             },
--         },
--         keymap = {
--             preset = 'enter',
--             ['<Tab>'] = { 'select_next', 'fallback' },
--             ['<S-Tab>'] = { 'select_prev', 'fallback' },
--             ['<Up>'] = { 'snippet_backward', 'fallback' },
--             ['<Down>'] = { 'snippet_forward', 'fallback' },
--             ['<C-Space>'] = { 'show' }
--         },
--
--         appearance = {
--             -- Sets the fallback highlight groups to nvim-cmp's highlight groups
--             -- Useful for when your theme doesn't support blink.cmp
--             -- Will be removed in a future release
--             use_nvim_cmp_as_default = true,
--             -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
--             -- Adjusts spacing to ensure icons are aligned
--             nerd_font_variant = 'mono',
--             kind_icons = {
--                 Copilot = "",
--             },
--         },
--         completion = {
--             menu = {
--                 auto_show = true,
--                 --border = "rounded",
--                 --winblend = 0,
--                 -- auto_show = function(ctx)
--                 --     return ctx.mode ~= "cmdline" or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
--                 -- end,
--
--                 draw = {
--                     columns = {
--                         { "label",     "label_description", gap = 1 },
--                         { "kind_icon", "kind",              gap = 2 }
--                     },
--                 },
--
--             },
--             documentation = {
--                 window = {
--                     border = "rounded",
--                     winblend = 0,
--                 },
--             },
--         },
--         signature = {
--             enabled = true,
--             window = {
--                 border = "rounded",
--                 winblend = 0,
--             },
--         },
--
--         -- Default list of enabled providers defined so that you can extend it
--         -- elsewhere in your config, without redefining it, due to `opts_extend`
--         sources = {
--             default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
--             providers = {
--                 copilot = {
--                     name = "copilot",
--                     module = "blink-cmp-copilot",
--                     score_offset = 100,
--                     async = true,
--                     transform_items = function(_, items)
--                         local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
--                         local kind_idx = #CompletionItemKind + 1
--                         CompletionItemKind[kind_idx] = "Copilot"
--                         for _, item in ipairs(items) do
--                             item.kind = kind_idx
--                         end
--                         return items
--                     end,
--                 },
--             },
--         },
--
--     },
--     opts_extend = { "sources.default" }
-- }
--
--Lualine - using the default statusbar
-- {
--     event = "VeryLazy",
--     'nvim-lualine/lualine.nvim',
--     dependencies = { 'arkav/lualine-lsp-progress' },
--     config = function()
--         require('lualine').setup {
--             options = {
--                 icons_enabled = true,
--                 theme = 'auto',
--                 component_separators = { left = '', right = '' },
--                 section_separators = { left = '', right = '' },
--                 disabled_filetypes = {},
--                 always_divide_middle = false,
--                 globalstatus = true,
--             },
--             sections = {
--                 lualine_a = { 'mode' },
--                 lualine_b = { 'branch' },
--                 lualine_c = { { 'filename', path = 1, file_status = true, newfile_status = false,
--                     symbols = {
--                         modified = '●', -- Text to show when the file is modified.
--                         readonly = '', -- Text to show when the file is non-modifiable or readonly.
--                         unnamed = '󰊠', -- Text to show for unnamed buffers.
--                         newfile = '', -- Text to show for newly created file before first write
--                     }
--                 } },
--                 lualine_x = { 'encoding', 'fileformat', 'filetype', 'lsp_progress' },
--                 lualine_y = { 'progress' },
--                 lualine_z = { 'location' }
--             },
--             inactive_sections = {
--                 lualine_a = {},
--                 lualine_b = {},
--                 lualine_c = {},
--                 lualine_x = {},
--                 lualine_y = {},
--                 lualine_z = {}
--             },
--             tabline = {},
--             extensions = {}
--         }
--     end
-- },
