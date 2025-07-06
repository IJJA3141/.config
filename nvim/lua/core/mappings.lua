local M = {}

M.mappings = {}
M.lsp = {}
M.dap = {}
M.ft = {}
M.ft.java = {}
M.ft.go = {}

M.mappings.n = {
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
	["<leader>tt"] = { function() require("core.functions").toggle_background() end, "Toggle transparency", },

  -- highlight
  ["<leader>nh"] = { "<cmd> noh <cr>", "No highlight" },

	-- oil
	["<leader>e"] = { "<cmd> Oil --float <cr>", "Oil on water" },

	-- no neck pain
	["<leader>nn"] = { "<cmd> NoNeckPain <cr>", "No neck pain" },

	-- telescope
	["<leader>ff"] = { "<cmd> Telescope fd <cr>", "Telescope finder" },
	["<leader>fg"] = { "<cmd> Telescope live_grep <cr>", "Telescope grep" },

  -- gitsigns
  ["<leader>ts"] = { "<cmd> Gitsigns toggle_signs <cr>", "Toggle gitsigns" }
}

M.mappings.i = {
	-- move in insert mode
	["<C-k>"] = { "<Up>", "Up" },
	["<C-j>"] = { "<Down>", "Down" },
	["<C-h>"] = { "<Left>", "Left" },
	["<C-l>"] = { "<Right>", "Right" },
  ["<C-n>"] = { "<cmd> noh <cr>", "No highlight" },

	-- move line up and down
  ["<A-k>"] = { "<cmd> move -2 <cr>", "Move line up" },
	["<A-j>"] = { "<cmd> move +1 <cr>", "Move line down" },
}

M.lsp.n = {
	-- Moves
	["<leader>gr"] = { "<cmd> Telescope lsp_references <cr>", "Lsp references" },
	["<leader>gd"] = { "<cmd> Telescope lsp_definitions <cr>", "Lsp definition" },
	["<leader>gD"] = { vim.lsp.buf.declaration, "Lsp declaration" },
	["<leader>gi"] = { "<cmd> Telescope lsp_implementations <cr>", "Lsp implementations" },
	["<leader>gT"] = { "<cmd> Telescope lsp_type_definition <cr>", "Lsp type definition" },

  ["[d"] = { "<cmd> lua vim.diagnostic.jump({count = -1}) <cr>", "Go to previous diagnostic"},
  ["]d"] = { "<cmd> lua vim.diagnostic.jump({count = 1}) <cr>", "Go to next diagnostic"},

	-- Info
	["<leader>le"] = { "<cmd> lua vim.diagnostic.open_float(nil, { focus = false }) <cr>", "Open diagnostic" },
	["<leader>ld"] = { "<cmd> Telescope diagnostics bufnr=0 <cr>", "Open buffer diagnostic" },
	["<leader>lD"] = { "<cmd> Telescope diagnostics <cr>", "Open all diagnostic" },
	["<leader>ls"] = { vim.lsp.buf.signature_help, "Lsp signature help" },
	["<leader>lh"] = { vim.lsp.buf.hover, "Lsp hover" },

	-- Actions
	["<leader>lr"] = { vim.lsp.buf.rename, "Lsp rename" },
	["<leader>la"] = { vim.lsp.buf.code_action, "Lsp code action" },
	["<leader>lf"] = { function() vim.lsp.buf.format({ async = true }) end, "Lsp format", },
}

M.lsp.i = {
	["<S-Tab"] = { vim.lsp.buf.completion, "Lsp completion" },
	["<S-Enter"] = { vim.lsp.buf.signature_help, "Lsp signature help" },
}

M.lsp.v = {
	["<leader>lf"] = { function() vim.lsp.buf.format({ async = true }) end, "Lsp format", },
}

M.dap.n = {
	["<leader>dc"] = { function() require("dap").continue() end,"Continue", },
  ["<leader>db"] = { function() require("dap").toggle_breakpoint() end, "Breakpoint", },
  ["<leader>ds"] = { function() require("dap").step_over() end, "Step over", },
  ["<leader>de"] = { function() require("dap").step_into() end, "Step into", },
  ["<leader>do"] = { function() require("dap").step_out() end, "Step out", },
  ["<leader>dv"] = { function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.scopes) end, "Scopes", },
  ["<leader>dk"] = { function() require("dap").terminate() end, "Terminate", },
  ["<leader>du"] = { function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "), nil, nil) end, },
  ["<leader>dl"] = { function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Msg: ")) end, }
}

M.ft.java.n = {
  ["<leader>lgd"] = { function() require("core.functions").generate_javadoc() end, "Generate Java doc" },
  ["<leader>lt"] = { function() require("jdtls").test_nearest_method() end, "Lsp run test method" },
  ["<leader>lT"] = { function() require("jdtls").test_class() end, "Lsp run test class"},
  ["<leader>lgt"] = { function() require("jdtls.tests").generate() end, "Lsp generate test"},
  ["<leader>gt"] = { function() require("jdtls.tests").goto_subjects() end, "Lsp test"},
}

M.ft.go.n = {
  ["<leader>lt"] = { function() require('dap-go').debug_test() end, "Lsp debug test"}
}

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

		for mode, binds in pairs(M.lsp) do
			for keys, func in pairs(binds) do
				opts.desc = func[2]
				vim.keymap.set(mode, keys, func[1], opts)
			end
		end
	end,
})

require("core.functions").setMappings(M.mappings)

return M
