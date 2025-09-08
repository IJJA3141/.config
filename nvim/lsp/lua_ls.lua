return {
  settings = {
    Lua = {
      diagnostics = {
        disable = { "missing-parameters", "missing-fields" }
      },
    },
  },

  on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
  end,
}
