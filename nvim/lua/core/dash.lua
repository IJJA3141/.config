local setup = {
	theme = "doom",
	hide = {
		-- enabling this messes up the actual laststatus setting after loading a file
		statusline = false,
	},

	config = {
		--header = require("core.dash"),
		center = {
			{ action = "Oil", desc = "Oil", icon = "󰉓  ", key = "e" },
			{
				action = "Telescope find_files",
				desc = "Find file",
				icon = "  ",
				key = "f",
			},
			{
				action = "Telescope oldfiles",
				desc = "Recent files",
				icon = "  ",
				key = "r",
			},
			{
				action = "Telescope live_grep",
				desc = "Find text",
				icon = "  ",
				key = "g",
			},
			{ action = "Lazy", desc = "Lazy", icon = "󰒲  ", key = "l" },
			{ action = "e $MYVIMRC", desc = "Config", icon = "  ", key = "c" },
			{ action = "qa", desc = "Quit", icon = "  ", key = "q" },
		},
		footer = function()
			return {
				"",
			}
		end,
	},
}

local images = require("core.asset.images")
local validkey = {}

for key, image in pairs(images) do
	if image.height <= vim.api.nvim_win_get_height(0) - 17 and image.width <= vim.api.nvim_win_get_width(0) - 2 then
		table.insert(validkey, key)
	end
end

if #validkey == 0 then
	table.insert(validkey, "Esla_Dorothy")
end

local key = validkey[math.random(1, #validkey)]

if images[key].is_url then
	setup.preview = {
		command = "cat", -- preview command
		file_path = images[key].content, -- preview file path
		file_height = images[key].height,
		file_width = images[key].width,
	}
else
	setup.config.header = vim.split(images[key].content, "\n")
end

require("dashboard").setup(setup)
