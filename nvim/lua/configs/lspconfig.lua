local lspconfig = require("lspconfig")

-- server list
local servers = {
	"lua_ls",
}

-- base setup
for _, lsp in pairs(servers) do
	lspconfig[lsp].setup({})
end

lspconfig.clangd.setup({
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
})
