local plugins = {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("nvchad.configs.null-ls")
			end,
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("nvchad.configs.lspconfig")
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
		ft = { "cpp", "c", "hpp", "h" },
	},
	{
		"Civitasv/cmake-tools.nvim",
		config = function()
			require("NvChad.configs.cmake-tools")
		end,
		ft = { "cpp", "c", "hpp", "h" },
	},
	{
		"p00f/clangd_extensions.nvim",
		config = function()
			require("NvChad.configs.clangd-extensions")
		end,
		ft = { "cpp", "c", "hpp", "h" },
	},
}

return plugins
