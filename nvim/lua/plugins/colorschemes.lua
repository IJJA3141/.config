return {
	{ -- Gruvbox
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		lazy = false,
		opts = {
			bold = false,
			alpha = true,
			terminal_colors = true,
			transparent_mode = true,
      overrides = {
        StatusLine = { fg = "NONE", bg = "NONE" },
        StatusLineNC = { fg = "NONE", bg = "NONE" },
      },
		},
	},
	{ -- Tokyonight
		"folke/tokyonight.nvim",
		name = "tokyonight",
		config = true,
	},
}
