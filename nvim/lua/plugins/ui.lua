return {
	{ -- Dashboard
		"IJJA3141/dashboard-nvim",
		event = "VimEnter",
    lazy = true,
		init = function()
			vim.opt.laststatus = 0
		end,
		config = function()
			require("core.dash")
		end,
	},
	{ -- Statusline
		"nvim-lualine/lualine.nvim",
		event = "BufRead",
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	},
	{ -- Notification
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		config = function()
			require("fidget").setup({
				window = {
					normal_hl = "Comment", -- Base highlight group in the notification window
					blend = 0, -- Background color opacity in the notification window
					border = "rounded", -- Border around the notification window
					zindex = 45, -- Stacking priority of the notification window
					max_width = 0, -- Maximum width of the notification window
					max_height = 0, -- Maximum height of the notification window
					x_padding = 10, -- Padding from right edge of window boundary
					y_padding = 10, -- Padding from bottom edge of window boundary
					relative = "editor",
				},
			})
		end,
	},
	{
		"shortcuts/no-neck-pain.nvim",
		opts = {
			minSideBufferWidth = 25,
			width = 100,
		},
	},

	{
		"norcalli/nvim-colorizer.lua",
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
