return {
	{
		{
			"mfussenegger/nvim-dap",
			dependencies = {
				"nvim-neotest/nvim-nio",
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
						name = "Launch file",
						type = "cppdbg",
						request = "launch",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
						end,
						cwd = "${workspaceFolder}",
						stopAtEntry = true,
					},
					{
						name = "Attach to gdbserver :1234",
						type = "cppdbg",
						request = "launch",
						MIMode = "gdb",
						miDebuggerServerAddress = "localhost:1234",
						miDebuggerPath = "/usr/bin/gdb",
						cwd = "${workspaceFolder}",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
						end,
					},
				}
			end,
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup()
		end,
	},
}
