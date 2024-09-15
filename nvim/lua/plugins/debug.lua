return {
	{ -- debug
		"mfussenegger/nvim-dap",
		cmd = { "DapContinue", "DapNew", "DapToggleBreakpoint" },
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
				{ text = "", texthl = "GruvboxRed", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)

			vim.fn.sign_define(
				"DapStopped",
				{ text = "➔", texthl = "GruvboxGreen", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)

			require("nvim-dap-virtual-text").setup()
			if vim.bo.filetype == "java" then
				require("jdtls.dap").setup_dap_main_class_configs()
			end
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
	},
}
