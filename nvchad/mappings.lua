local mappings = {}

mappings.custom = {
	n = {
		["<leader>k"] = { "<cmd> move -2 <cr>", "Move up" },
		["<leader>j"] = { "<cmd> move +1 <cr>", "Move down" },
		["<leader>tt"] = {
			function()
				require("base46").toggle_transparency()
			end,
			"Toggle transparency",
		},
		["<leader>sh"] = { "<cmd> set list listchars=tab:>\\ ,trail:-,eol:$ <cr>", "Show hidden characters" },
	},
	i = {
		["<C-S-k>"] = { "<cmd> move -2 <cr>", "Move up" },
		["<C-S-j>"] = { "<cmd> move +1 <cr>", "Move down" },
	},
}

return mappings
