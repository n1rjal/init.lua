-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim';
    use 'nvim-tree/nvim-tree.lua';
    use 'preservim/tagbar';

    use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    };

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    };



    use "tpope/vim-fugitive";

    -- for commentary
    use 'b3nj5m1n/kommentary'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4'
    }

    use { 'akinsho/git-conflict.nvim', tag = "*", config = function()
        require('git-conflict').setup()
    end }

    use {
        'moozd/aidoc.nvim',
        config = function()
            require('aidoc').setup({
                email = "nirjalpaudel54312@gmail.com",
                width = 50,
                keymap = "<leader>m",
            })
        end,
    }



    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use "MunifTanjim/prettier.nvim";

    use {
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    };

    use("nvim-treesitter/playground");
    use "nvim-lua/plenary.nvim";


    use {
        "williamboman/mason.nvim"
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
    use 'lewis6991/gitsigns.nvim'   -- OPTIONAL: for git status
    use 'romgrk/barbar.nvim'
end)
