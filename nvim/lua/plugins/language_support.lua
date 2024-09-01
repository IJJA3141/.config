return {
	-- lsps
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lspconfig")
		end,
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("config.null-ls")
		end,
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
	},

	-- suggestions
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"FelipeLema/cmp-async-path",
		},
		config = function()
			require("config.cmpconfig")
		end,
	},

	-- syntax highlight
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		opts = {
			highlight = {
				enable = true,
				use_languagetree = true,
				disable = { "cpp", "sh", "shell", "help" },
			},

			ensure_installed = {
				"bash",
				"cmake",
				"cpp",
				"css",
				"gitignore",
				"html",
				"hyprlang",
				"javascript",
				"jq",
				"jsdoc",
				"json",
				"latex",
				"lua",
				"luadoc",
				"make",
				"markdown",
				"python",
				"scss",
				"ssh_config",
				"typescript",
				"vim",
				"vimdoc",
				"yuck",
			},
		},
	},

	-- miscellaneous
	{ "elkowar/yuck.vim", ft = { "yuck" } },
}
