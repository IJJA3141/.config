return {
	{
		"IJJA3141/neovim-dashboard",
		dependencies = { "m00qek/baleia.nvim" },
	},
	{
		"shortcuts/no-neck-pain.nvim",
		cmd = { "NoNeckPain" },
		opts = {
			minSideBufferWidth = 35,
			width = 120,
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("colorizer").setup({ "*" })
		end,
	},
	{
		"echasnovski/mini.indentscope",
		event = "BufRead",
		opts = {
			symbol = "|",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"oil",
					"lazy",
					"mason",
					"dashboard",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
}
