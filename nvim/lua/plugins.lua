local plugins = {
	{
		"williamboman/mason.nvim",
		config = function()
			require("configs.mason")
		end,
	},
	{"nvim-treesitter/nvim-treesitter"},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
	{"jose-elias-alvarez/null-ls.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	}

require("lazy").setup(plugins)
