local plugins = {
	{ "nvim-lua/plenary.nvim" },
	{
		"williamboman/mason.nvim",
		config = function()
			require("configs.mason")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("configs.null-ls")
		end,
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("configs.treesitter")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
	{ "nvim-telescope/telescope.nvim" },

	-- NvChad things
	{ "NvChad/ui" },
}

require("lazy").setup(plugins)
