return {
    --theme
    {
        "sainnhe/gruvbox-material",
        config = function()
            vim.g.gruvbox_material_background = 'hard'
            vim.cmd('colorscheme gruvbox-material')
        end
    },

    {
        event = "VeryLazy",
        'github/copilot.vim',
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
        end
    },
    --"terryma/vim-smooth-scroll",
    --'nvim-lua/plenary.nvim',
    {
        event = "VeryLazy",
        'tpope/vim-fugitive',
    },
    {
        event = "VeryLazy",
        'preservim/nerdcommenter',
    },
    {
        event = "VeryLazy",
        'stevearc/oil.nvim',
        opts = {}
    }, -- use g. to show hidden files
    {
        event = "VeryLazy",
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signs                        = {
                    add          = { text = '┃' },
                    change       = { text = '┃' },
                    delete       = { text = '_' },
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
                    virt_text = true,
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
                    border = 'single',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
            }
        end
    },
    --{
    --event = "VeryLazy",
    --'nvim-lualine/lualine.nvim',
    --config = function()
    --require('lualine').setup {
    --options = {
    --icons_enabled = true,
    --theme = 'auto',
    --component_separators = { left = '', right = '' },
    --section_separators = { left = '', right = '' },
    --disabled_filetypes = {},
    --always_divide_middle = false,
    --globalstatus = true,
    --},
    --sections = {
    --lualine_a = { 'mode' },
    --lualine_b = { 'branch', { 'diagnostics', always_visible = true } },
    --lualine_c = { { 'filename', path = 1, file_status = true, newfile_status = false,
    --symbols = {
    --modified = '●', -- Text to show when the file is modified.
    --readonly = '', -- Text to show when the file is non-modifiable or readonly.
    --unnamed = '󰊠', -- Text to show for unnamed buffers.
    --newfile = '', -- Text to show for newly created file before first write
    --}
    --} },
    --lualine_x = { 'encoding', 'fileformat', 'filetype' },
    --lualine_y = { 'progress' },
    --lualine_z = { 'location' }
    --},
    --inactive_sections = {
    --lualine_a = {},
    --lualine_b = {},
    --lualine_c = {},
    --lualine_x = {},
    --lualine_y = {},
    --lualine_z = {}
    --},
    --tabline = {},
    --extensions = {}
    --}
    --end
    --},
    {
        event = "VeryLazy",
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({
                files      = {
                    fd_opts =
                    [[--color=never --type f --hidden --follow --exclude .git --exclude node_modules ]],
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
        event = "VeryLazy",
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "go", "lua", "javascript", "html", "typescript", "css", "scss", "terraform", "tsx",
                    "bash", "markdown" },

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
    'hrsh7th/cmp-nvim-lsp-signature-help',
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    },
    --"onsails/lspkind.nvim",
    --{
    --event = "VeryLazy",
    --"j-hui/fidget.nvim",
    --opts = {
    ---- options
    --},
    --config = function()
    --require("fidget").setup({
    --progress = {
    --display = {
    --done_icon = "",
    --progress_icon = -- Icon shown when LSP progress tasks are in progress
    --{ pattern = "grow_vertical", period = 1 },
    --},
    --},
    --notification = {
    --window = {
    --winblend = 0,
    --},
    --},
    --})
    --end,
    --},
    {
        event = "VeryLazy",
        'stevearc/conform.nvim',
        opts = {},
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    css = { { "prettier" } },
                    scss = { { "prettier" } },
                    go = { "goimports", "gofmt" },
                    rust = { "rustfmt" },
                    python = { "black" },
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
