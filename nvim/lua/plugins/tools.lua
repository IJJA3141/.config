return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "Oil" },
		opts = {
			default_file_explorer = true,
			columns = { "icon" },
			buf_options = {
				buflisted = false,
				bufhidden = "hide",
			},
			view_options = {
				show_hidden = true,
				is_hidden_file = function(name, bufnr)
					return vim.startswith(name, ".")
				end,
				is_always_hidden = function(name, bufnr)
					return false
				end,
				sort = {
					{ "type", "asc" },
					{ "name", "asc" },
				},
			},
			float = {
				padding = 5,
				max_width = 70,
				max_height = 0,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
				override = function(conf)
					return conf
				end,
			},
		},
	},
	{
		"folke/which-key.nvim",
		dependencies = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "Telescope" },
	},
}
