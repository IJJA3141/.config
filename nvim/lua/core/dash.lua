local setup = {}

setup.dashboards = require("core.asset.images")

setup.keybinds = {
	{ func = "Oil", description = "Oil", icon = "󰉓", key = "e" },
	{
		func = "Telescope find_files",
		description = "Find file",
		icon = "",
		key = "f",
	},
	{
		func = "Telescope oldfiles",
		description = "Recent files",
		icon = "",
		key = "r",
	},
	{
		func = "Telescope live_grep",
		description = "Find text",
		icon = "",
		key = "g",
	},
	{ func = "Lazy", description = "Lazy", icon = "󰒲", key = "l" },
	{ func = "e $MYVIMRC", description = "Config", icon = "", key = "c" },
	{ func = "qa", description = "Quit", icon = "", key = "q" },
}

setup.keybind_max_width = 75
setup.keybind_padding = 4

require("neovim-dashboard").setup(setup)
