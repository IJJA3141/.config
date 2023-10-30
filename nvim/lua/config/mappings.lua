local mappings = {}

mappings.n = {
	-- switch between windows
	["<C-h>"] = { "<C-w>h", "Window left" },
	["<C-l>"] = { "<C-w>l", "Window right" },
	["<C-j>"] = { "<C-w>j", "Window down" },
	["<C-k>"] = { "<C-w>k", "Window up" },

	-- move line up and down
	["<A-k>"] = { "<cmd> move +1 <cr>", "Move line up" },
	["<A-j>"] = { "<cmd> move -2 <cr>", "Move line down" },

	-- oil
	["<leader>e"] = { "<cmd> Oil --float <cr>", "Oil on water" },

	-- no neck pain
	["<leader>nn"] = { "<cmd> NoNeckPain <cr>", "No neck pain" },

	-- telescope
	["<leader>tf"] = { "<cmd> Telescope fd <cr>", "Telescope finder" },
	["<leader>tg"] = { "<cmd> Telescope live_grep <cr>", "Telescope finder" },
}

mappings.i = {
	-- move in insert mode
	["<C-j>"] = { "<Down>", "Down" },
	["<C-k>"] = { "<Up>", "Up" },
	["<C-h>"] = { "<Left>", "Left" },
	["<C-L>"] = { "<Right>", "Right" },

	-- move line up and down
	["<A-k>"] = { "<cmd> move +1 <cr>", "Move line up" },
	["<A-j>"] = { "<cmd> move -2 <cr>", "Move line down" },
}

mappings.v = {}

for mode, binds in pairs(mappings) do
	for keys, func in pairs(binds) do
		vim.keymap.set(mode, keys, func[1], { desc = func[2] })
	end
end

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
