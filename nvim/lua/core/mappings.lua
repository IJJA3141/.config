local M = {}

M.dinamic_dap = {}
M.mappings = {}
M.dap = {}
M.lsp = {}

------  mappings  ------
M.mappings.n = {
  -- switch between windows
  ["<C-h>"] = { "<C-w>h", "Window left" },
  ["<C-l>"] = { "<C-w>l", "Window right" },
  ["<C-j>"] = { "<C-w>j", "Window down" },
  ["<C-k>"] = { "<C-w>k", "Window up" },

  -- move line up and down
  ["<A-j>"] = { "<cmd> move +1 <cr>", "Move line down" },
  ["<A-k>"] = { "<cmd> move -2 <cr>", "Move line up" },

  -- transparentie
  ["<leader>tt"] = { function() require("core.functions").toggle_trans() end, "Toggle transparency", },

  -- highlight
  ["<leader>nh"] = { "<cmd> noh <cr>", "No highlight" },

  -- config
  ["<leader>o"] = { "<cmd> source <cr>", "Reload config" },
}

require("core.functions").set_mappings(M.mappings)
------  lsp  ------
M.lsp.n = {
  ["mr"] = { "<cmd> Telescope lsp_references <cr>", "Lsp references" },
  ["md"] = { "<cmd> Telescope lsp_definitions <cr>", "Lsp definitions" },
  ["mD"] = { vim.lsp.buf.declaration, "Lsp declaration" },
  ["mi"] = { "<cmd> Telescope lsp_implementations <cr>", "Lsp implementations" },
  ["mt"] = { "<cmd> Telescope lsp_type_definitions<cr>", "Lsp type definition" },

  ["<leader>lf"] = { vim.lsp.buf.format, "Format file" },
  ["<leader>la"] = { vim.lsp.buf.code_action, "Lsp code action" },
  ["<leader>lr"] = { vim.lsp.buf.rename, "Lsp code action" },
}

M.lsp.v = {
  ["<leader>lf"] = { function() vim.lsp.buf.format({ async = true }) end, "Format selection" }
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args) require("core.functions").set_mappings(M.lsp, { buffer = args.buf }) end
})

return M
