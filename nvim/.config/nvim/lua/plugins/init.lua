return {
    'wbthomason/packer.nvim',
    'nvim-lua/plenary.nvim',
    'tpope/vim-fugitive', -- Git
    'preservim/nerdcommenter',
    'ThePrimeagen/harpoon',
    "lukas-reineke/indent-blankline.nvim",
    'loadfms/chettahsheet.nvim',
    'tpope/vim-vinegar',
    'tpope/vim-dispatch',
    'nyoom-engineering/nyoom.nvim',
    'nvim-tree/nvim-web-devicons',
    'shaunsingh/nord.nvim',
    'Mofiqul/dracula.nvim',
    'sainnhe/gruvbox-material',
    { "ellisonleao/gruvbox.nvim" },
    'folke/tokyonight.nvim',
    "rebelot/kanagawa.nvim",
    { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },
    { "catppuccin/nvim",
        name = "catppuccin",
        config = function()

            require("catppuccin").setup({
                flavour = "macchiato", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = false,
                term_colors = false,
                dim_inactive = {
                    enabled = false,
                    shade = "dark",
                    percentage = 0.15,
                },
                no_italic = false, -- Force no italic
                no_bold = false, -- Force no bold
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                },
                color_overrides = {},
                custom_highlights = {},
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    telescope = true,
                    notify = false,
                    mini = false,
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
            })


        end },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require('rose-pine').setup({
                --- @usage 'main' | 'moon'
                dark_variant = 'moon',
                bold_vert_split = false,
                dim_nc_background = false,
                disable_background = false,
                disable_float_background = false,
                disable_italics = false,

                --- @usage string hex value or named color from rosepinetheme.com/palette
                groups = {
                    background = 'base',
                    panel = 'surface',
                    border = 'highlight_med',
                    comment = 'muted',
                    link = 'iris',
                    punctuation = 'subtle',

                    error = 'love',
                    hint = 'iris',
                    info = 'foam',
                    warn = 'gold',

                    headings = {
                        h1 = 'iris',
                        h2 = 'foam',
                        h3 = 'rose',
                        h4 = 'gold',
                        h5 = 'pine',
                        h6 = 'foam',
                    }
                    -- or set all headings at once
                    -- headings = 'subtle'
                },

                -- Change specific vim highlight groups
                highlight_groups = {
                    ColorColumn = { bg = 'rose' }
                }
            })
        end
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    },
}
