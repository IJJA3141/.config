local lsp = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- server list
local servers = {
  "cmake",
  "tsserver",
  "html",
  "htmx",
  "cssls",
  "jsonls",
  "pylsp",
  "bashls",
  "cairo_ls",
  "dotls",
  "jqls",
  "ltex",
  "bashls",
  "cmake",
  "cssls",
  "yamlls",
  "jsonls",
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
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          [vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },

  on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

-- pylsp
lsp.pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "W391" },
          maxLineLength = 400,
        },
      },
    },
  },
})
