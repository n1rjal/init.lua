-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
-- Only required if you have packer configured as `opt`
--
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("lukas-reineke/indent-blankline.nvim")
	use("preservim/tagbar")

	use("nvim-treesitter/nvim-treesitter-context")

	use("mg979/vim-visual-multi")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "onsails/lspkind.nvim" })

	use("mattn/emmet-vim")

	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
	})

	-- for debugging  application
	use("mfussenegger/nvim-dap", {
		requires = { "rcarriga/nvim-dap-ui" },
		opts = {
			ft = "python",
		},
	})

	use("mfussenegger/nvim-dap-python")

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

	use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })

	use("nvim-treesitter/playground")

	use({
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"black",
				"debugpy",
				"js-debug-adapter",

				-- for spellings
				"codespell",
				"misspell",
				"csspell",
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
			{ "davidsierradz/cmp-conventionalcommits" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"davidsierradz/cmp-conventionalcommits",
		},
	})

	use("nvim-lua/plenary.nvim")
	use("ThePrimeagen/harpoon")

	use("nvim-tree/nvim-web-devicons") -- OPTIONAL: for file icons
	use("lewis6991/gitsigns.nvim") -- OPTIONAL: for git status
end)
