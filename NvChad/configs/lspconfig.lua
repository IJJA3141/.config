local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- server list
local servers = { "rust_analyzer", "clangd", "tsserver", "pyright", "texlab", "lua_ls" }

-- base setup
for _, lsp in pairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- json
local vscode_json_capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.jsonls.setup({
	capabilities = vscode_json_capabilities,
})

-- html
local vscode_html_capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup({
	capabilities = vscode_html_capabilities,
})

-- overflowing diagnostic fix
vim.diagnostic.config({
	virtual_text = false,
})

-- automatically show diagnostic
vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
