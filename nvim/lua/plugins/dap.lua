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
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/out/Debug/", "file")
						end,
						cwd = "${workspaceFolder}",
						stopAtEntry = true,
					},
					{
						name = "Launch file sudo",
						type = "cppdbg",
						request = "launch",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/out/Debug/", "file")
						end,
						cwd = "${workspaceFolder}",
						stopAtEntry = true,
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
