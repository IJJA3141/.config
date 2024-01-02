local mappings = {}

mappings.n = {
	-- switch between windows
	["<C-h>"] = { "<C-w>h", "Window left" },
	["<C-l>"] = { "<C-w>l", "Window right" },
	["<C-j>"] = { "<C-w>j", "Window down" },
	["<C-k>"] = { "<C-w>k", "Window up" },

	-- move line up and down
	["<A-j>"] = { "<cmd> move +1 <cr>", "Move line down" },
	["<A-k>"] = { "<cmd> move -2 <cr>", "Move line up" },

	-- oil
	["<leader>e"] = { "<cmd> Oil --float <cr>", "Oil on water" },

	-- no neck pain
	["<leader>nn"] = { "<cmd> NoNeckPain <cr>", "No neck pain" },

	-- telescope
	["<leader>tf"] = { "<cmd> Telescope fd <cr>", "Telescope finder" },
	["<leader>tg"] = { "<cmd> Telescope live_grep <cr>", "Telescope finder" },

	-- split
	["<leader>sv"] = { "<cmd> vsplit <cr>", "Vertical split" },
	["<leader>sh"] = { "<cmd> split <cr>", "Horizontal split" },

	-- transparentie
	["<leader>tt"] = {
		function()
			if vim.g.colors_name == "gruvbox" then
				require("gruvbox").config.transparent_mode = not require("gruvbox").config.transparent_mode
				vim.cmd("colorscheme gruvbox")
			end
		end,
		"Toggle transparency",
	},
}

mappings.i = {
	-- move in insert mode
	["<C-j>"] = { "<Down>", "Down" },
	["<C-k>"] = { "<Up>", "Up" },
	["<C-h>"] = { "<Left>", "Left" },
	["<C-L>"] = { "<Right>", "Right" },

	-- move line up and down
	["<A-k>"] = { "<cmd> move -2 <cr>", "Move line up" },
	["<A-j>"] = { "<cmd> move +1 <cr>", "Move line down" },
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

		local lspmappings = {}
		lspmappings.n = {
			["<leader>gD"] = { vim.lsp.buf.declaration, "Lsp declaration" },
			["<leader>gd"] = { vim.lsp.buf.definition, "Lsp definition" },
			["<leader>K"] = { vim.lsp.buf.hover, "Lsp hover" },
			["<leader>gi"] = { vim.lsp.buf.implementation, "Lsp implementatoin" },
			["<leader><C-k>"] = { vim.lsp.buf.signature_help, "Lsp signature help" },
			["<leader>wa"] = { vim.lsp.buf.add_workspace_folder, "Lsp add workspace folder" },
			["<leader>wr"] = { vim.lsp.buf.remove_workspace_folder, "Lsp remove workspace folder" },
			["<leader>wl"] = {
				function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end,
				"Lsp list workspace  folders",
			},

			["<leader>D"] = { vim.lsp.buf.type_definition, "Lsp type definition" },
			["<leader>rn"] = { vim.lsp.buf.rename, "Lsp rename" },
			["<leader>ca"] = { vim.lsp.buf.code_action, "Lsp code action" },
			["<leader>gr"] = { vim.lsp.buf.references, "Lsp references" },
			["<leader>f"] = {
				function()
					vim.lsp.buf.format({ async = true })
				end,
				"Lsp format",
			},
		}

		for mode, binds in pairs(lspmappings) do
			for keys, func in pairs(binds) do
				opts.desc = func[2]
				vim.keymap.set(mode, keys, func[1], opts)
			end
		end
	end,
})
