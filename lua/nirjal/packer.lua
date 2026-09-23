-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
-- Only required if you have packer configured as `opt`
--
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"moozd/aidoc.nvim",
		config = function()
			require("aidoc").setup({
				email = "nirjalpaudel54312@gmail.com",
				width = 65,
				keymap = "<leader>mp",
			})
		end,
	})

	use({
		"olimorris/onedarkpro.nvim", -- for Obsidian
		name = "onedarkpro",
	})
	use({
		"mcchrish/zenbones.nvim", -- includes seoulbones
		dependencies = { "rktjmp/lush.nvim" },
	})

	use("lukas-reineke/indent-blankline.nvim")
	use("preservim/tagbar")

	use("mg979/vim-visual-multi")

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
		tag = "0.1.8",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "mhartington/formatter.nvim" })

	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	})

	-- Pinned to the master branch: the new default `main` branch removed the
	-- `nvim-treesitter.configs` module and requires Neovim 0.11+.
	use({ "nvim-treesitter/nvim-treesitter", branch = "master", run = ":TSUpdate" })

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
			-- Pinned to v1.x: mason-lspconfig v2 (main) requires Neovim 0.11+
			-- (calls vim.lsp.enable) and changes the lsp-zero handler API.
			{ "williamboman/mason-lspconfig.nvim", tag = "v1.32.0" },

			-- LSP Support
			-- Pinned to v1.8.0: nvim-lspconfig v2.x (master) dropped Neovim 0.10.
			{ "neovim/nvim-lspconfig", tag = "v1.8.0" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "davidsierradz/cmp-conventionalcommits" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	use("nvim-lua/plenary.nvim")
	use("ThePrimeagen/harpoon")
end)
