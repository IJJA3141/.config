local mappings = {}

mappings.custom = {
	n = {
		["<leader><up>"] = { "<cmd> move -2 <cr>", "move up" },
		["<leader><down>"] = { "<cmd> move +1 <cr>", "move down" },
		["<leader>tt"] = {
			function()
				require("base46").toggle_transparency()
			end,
			"toggle transparency",
		},
	},
	i = {
		["<S-up>"] = { "<cmd> move -2 <cr>", "move up" },
		["<S-down>"] = { "<cmd> move +1 <cr>", "move down" },
	},
}

return mappings
