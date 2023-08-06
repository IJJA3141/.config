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

mappings.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line",
		},
		["<leader>dr"] = {
			"<cmd> DapContinue <CR>",
			"Start or continue the debugger",
		},
	},
}

return mappings
