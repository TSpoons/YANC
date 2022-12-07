return require('packer').startup(function()

-------------------------------------------------------------------------------
  -- Package manager
    
    use 'wbthomason/packer.nvim'

-------------------------------------------------------------------------------
-- LSP

    -- Manage LSP servers, debuggers and linters
    use 'williamboman/mason.nvim'    
    use 'williamboman/mason-lspconfig.nvim'

    -- Collection of LSP configs
    use 'neovim/nvim-lspconfig' 

-------------------------------------------------------------------------------
-- Key Mapping

    use 'folke/which-key.nvim'

-------------------------------------------------------------------------------
-- Terminal

    use 'aserowy/tmux.nvim'

-------------------------------------------------------------------------------
-- Completion

    -- Completion framework:
    use 'hrsh7th/nvim-cmp' 

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/vim-vsnip'

    -- Parsing
    use 'nvim-treesitter/nvim-treesitter'

    -- Parentheses
    use 'windwp/nvim-autopairs'

    -- Comments 
    use 'terrortylor/nvim-comment'
-------------------------------------------------------------------------------
-- Appearance

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- Color scheme
    use "rebelot/kanagawa.nvim"

    -- Tab line
    use {
        'romgrk/barbar.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    use 'kyazdani42/nvim-web-devicons'

-------------------------------------------------------------------------------
-- Motion

    -- Quick motion
    use 'ggandor/leap.nvim'

-------------------------------------------------------------------------------
-- Languages

    -- Rust
    use 'simrat39/rust-tools.nvim'

-------------------------------------------------------------------------------
-- Search

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {'nvim-lua/plenary.nvim'}
    }

-------------------------------------------------------------------------------
-- File navigator

    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        tag = 'nightly'
    }

-------------------------------------------------------------------------------
-- Tabs

    use "lukas-reineke/indent-blankline.nvim"

end)

