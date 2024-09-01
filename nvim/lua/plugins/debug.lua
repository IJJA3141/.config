return {
	{ -- debug
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "nvim-neotest/nvim-nio" },
			{
				"theHamsta/nvim-dap-virtual-text",
				dependencies = { "nvim-neotest/nvim-nio" },
				config = true,
			},
		},
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
		end,
	},
}
