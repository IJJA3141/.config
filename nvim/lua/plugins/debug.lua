return {
	{ -- debug
		"mfussenegger/nvim-dap",
		ft = { "cpp", "java" },
		-- cmd = { "DapContinue", "DapNew", "DapToggleBreakpoint" },
		dependencies = { "jay-babu/mason-nvim-dap.nvim" },
		config = function()
			local dap = require("dap")

			dap.adapters.cppdbg = {
				id = "cppdbg",
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
			}

			dap.configurations.cpp = {
				{
					name = "Launch debug",
					type = "cppdbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/out/Debug/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopAtEntry = true,
				},
				{
					name = "Launch release",
					type = "cppdbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/out/Release/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopAtEntry = true,
				},
			}

			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
			)

			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "", texthl = "DiagnosticSignHint", linehl = "", numhl = "" }
			)

			vim.fn.sign_define(
				"DapBreakpointRejected",
				{ text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" }
			)

			vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })

			vim.fn.sign_define("DapStopped", {
				text = "",
				linehl = "debugPC",
				numhl = "debugPC",
			})

			dap.defaults.fallback.terminal_win_cmd = "horizontal belowright 15split"

			require("nvim-dap-virtual-text").setup()
			require("core.functions").setMappings(require("core.mappings").dap)
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
	},
}
