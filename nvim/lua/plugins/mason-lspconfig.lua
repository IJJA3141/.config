return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			--Lua
			"lua_ls",

			--Cpp
			"clangd",
		},
	},
}
