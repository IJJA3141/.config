local plugins = {
	{
		"vim-crystal/vim-crystal",
		ft = "crystal",
		config = function(_)
			vim.g.crystal_auto_format = 1
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("NvChad.configs.null-ls")
			end,
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("NvChad.configs.lspconfig")
		end,
	},
	{
		"lervag/vimtex",
		lazy = false,
	},
	{
		"IJJA3141/vim-Freshfox",
		config = function()
			require("NvChad.configs.vim-Freshfox")
		end,
		lazy = true,
		ft = { "tex" },
	},
	{
		"andweeb/presence.nvim",
		lazy = false,
		config = function()
			require("NvChad.configs.dicord")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		event = "VeryLazy",
		opts = {
			hanflers = {},
			ensure_installed = {
				"codelldb",
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		config = function(_, _)
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"cdelledonne/vim-cmake",
		lazy = false,
	},
}

return plugins
