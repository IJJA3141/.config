local lsp = require("lspconfig")

-- server list
local servers = { "lua_ls" }

-- default
for _, server in ipairs(servers) do
	lsp[server].setup({})
end

-- cpp
lsp.clangd.setup({
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
})
