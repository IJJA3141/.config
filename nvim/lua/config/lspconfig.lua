local lsp = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- server list
local servers = {
	"cmake",
	"html",
	"cssls",
	"jsonls",
	"bashls",
}

-- default
for _, server in ipairs(servers) do
	lsp[server].setup({
		capabilities = capabilities,
	})
end

-- cpp
lsp.clangd.setup({
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
})

-- lua
lsp.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			format = {
				enable = false,
			},
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},

	on_attach = function(client, bufnr)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})

-- pylsp
lsp.pylsp.setup({
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W391", "E402" },
					maxLineLength = 400,
				},
			},
		},
	},
})
