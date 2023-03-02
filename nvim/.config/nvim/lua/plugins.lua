return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Packer can manage itself
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim' -- Telescope
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            -- Snippet Collection (Optional)
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use { 'nvim-lualine/lualine.nvim' } -- Lua Line
    use 'tpope/vim-fugitive' -- Git
    use { 'lewis6991/gitsigns.nvim' }
    use 'preservim/nerdcommenter' -- Commenter
    use 'ThePrimeagen/harpoon' -- harpoon!
    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
    use "lukas-reineke/indent-blankline.nvim"
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'loadfms/chettahsheet.nvim'
    use 'tpope/vim-vinegar'
    use 'prichrd/netrw.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'tpope/vim-dispatch'
    use 'nyoom-engineering/nyoom.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use { "catppuccin/nvim", as = "catppuccin" }
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })
    use 'shaunsingh/nord.nvim'
    use 'Mofiqul/dracula.nvim'
    use 'sainnhe/gruvbox-material'
    use { "ellisonleao/gruvbox.nvim" }
    use 'folke/tokyonight.nvim'
    use "rebelot/kanagawa.nvim"
end)
