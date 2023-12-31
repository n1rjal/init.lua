-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("preservim/tagbar")

	use("nvim-treesitter/nvim-treesitter-context")
	use({
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
			})
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- for debugging python application
	use("mfussenegger/nvim-dap", {
		requires = { "rcarriga/nvim-dap-ui" },
		opts = {
			ft = "python",
		},
	})

	use({
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
	})
	use("theHamsta/nvim-dap-virtual-text")

	use("tpope/vim-fugitive")

	-- for commentary
	use("b3nj5m1n/kommentary")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
	})

	use({
		"moozd/aidoc.nvim",
		config = function()
			require("aidoc").setup({
				email = "nirjalpaudel54312@gmail.com",
				width = 50,
				keymap = "<leader>m",
			})
		end,
	})

	use({ "mhartington/formatter.nvim" })

	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		{ run = ":TSUpdate" },
	})

	use("nvim-treesitter/playground")

	use({
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"black",
				"debugpy",
				"js-debug-adapter",
			},
		},
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	use("nvim-lua/plenary.nvim")
	use("ThePrimeagen/harpoon")

	use("nvim-tree/nvim-web-devicons") -- OPTIONAL: for file icons
	use("lewis6991/gitsigns.nvim") -- OPTIONAL: for git status
end)
