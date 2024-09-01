local mappings = {}
local lspmappings = {}

mappings.n = {
	-- switch between windows
	["<C-h>"] = { "<C-w>h", "Window left" },
	["<C-l>"] = { "<C-w>l", "Window right" },
	["<C-j>"] = { "<C-w>j", "Window down" },
	["<C-k>"] = { "<C-w>k", "Window up" },

	-- move line up and down
	["<A-j>"] = { "<cmd> move +1 <cr>", "Move line down" },
	["<A-k>"] = { "<cmd> move -2 <cr>", "Move line up" },

	-- split
	["<leader>vs"] = { "<cmd> vsplit <cr>", "Vertical split" },
	["<leader>sv"] = { "<cmd> vsplit <cr>", "Vertical split" },
	["<leader>hs"] = { "<cmd> split <cr>", "Horizontal split" },
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

	-- oil
	["<leader>e"] = { "<cmd> Oil --float <cr>", "Oil on water" },

	-- no neck pain
	["<leader>nn"] = { "<cmd> NoNeckPain <cr>", "No neck pain" },

	-- telescope
	["<leader>ff"] = { "<cmd> Telescope fd <cr>", "Telescope finder" },
	["<leader>fg"] = { "<cmd> Telescope live_grep <cr>", "Telescope finder" },

	-- dap
	["<leader>dc"] = {
		function()
			require("dap").continue()
		end,
		"Continue",
	},
	["<leader>db"] = {
		function()
			require("dap").toggle_breakpoint()
		end,
		"Breakpoint",
	},
	["<leader>ds"] = {
		function()
			require("dap").step_over()
		end,
		"Step over",
	},
	["<leader>de"] = {
		function()
			require("dap").step_into()
		end,
		"Step into",
	},
	["<leader>do"] = {
		function()
			require("dap").step_out()
		end,
		"Step out",
	},
	["<leader>dv"] = {
		function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end,
		"Scopes",
	},
}

mappings.i = {
	-- move in insert mode
	["<C-j>"] = { "<Down>", "Down" },
	["<C-k>"] = { "<Up>", "Up" },
	["<C-h>"] = { "<Left>", "Left" },
	["<C-L>"] = { "<Right>", "Right" },

	-- move line up and down ["<A-k>"] = { "<cmd> move -2 <cr>", "Move line up" },
	["<A-j>"] = { "<cmd> move +1 <cr>", "Move line down" },
}

lspmappings.n = {
	-- Moves
	["<leader>gD"] = { vim.lsp.buf.declaration, "Lsp declaration" },
	["<leader>gd"] = { vim.lsp.buf.definition, "Lsp definition" },
	["<leader>gi"] = { vim.lsp.buf.implementation, "Lsp implementatoin" },
	["<leader>gr"] = { vim.lsp.buf.references, "Lsp references" },

	-- Info
	["<leader>lh"] = { vim.lsp.buf.hover, "Lsp hover" },
	["<leader>le"] = { "<cmd>lua vim.diagnostic.open_float(nil, { focus = false }) <cr>" },
	["<leader>ls"] = { vim.lsp.buf.signature_help, "Lsp signature help" },
	["<leader>lt"] = { vim.lsp.buf.type_definition, "Lsp type definition" },

	-- Actions
	["<leader>la"] = { vim.lsp.buf.code_action, "Lsp code action" },
	["<leader>lr"] = { vim.lsp.buf.rename, "Lsp rename" },
	["<leader>lf"] = {
		function()
			vim.lsp.buf.format({ async = true })
		end,
		"Lsp format",
	},
}

lspmappings.i = {
	--["<C-i>"] = { vim.lsp.buf.completion, "" }, ?
}

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

		for mode, binds in pairs(lspmappings) do
			for keys, func in pairs(binds) do
				opts.desc = func[2]
				vim.keymap.set(mode, keys, func[1], opts)
			end
		end
	end,
})

return cmpmappings
