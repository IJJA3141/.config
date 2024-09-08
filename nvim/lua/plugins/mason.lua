return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
	},

	{ -- lsp
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"cmake",
				"clangd",
				"html",
				"cssls",
				"tsserver",
				"jsonls",
				"pylsp",
				"bashls",
				"jdtls",
			},
		},
	},
	{ -- null-ls
		"jay-babu/mason-null-ls.nvim",
		dependencies = { "nvimtools/none-ls.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = {
				"luacheck",
				"stylua",
				"clang-format",
				"prettier",
				"ts-standard",
				"shellcheck",
				"beautysh",
				"black",
			},
			automatic_installation = true,
		},
	},
	{ -- dap
		"jay-babu/mason-nvim-dap.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = { "cppdbg", "javadbg" },
			automatic_installation = true,
		},
	},
}
