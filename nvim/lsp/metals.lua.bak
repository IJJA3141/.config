local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

-- *READ THIS*
-- I *highly* recommend setting statusBarProvider to either "off" or "on"
--
-- "off" will enable LSP progress notifications by Metals and you'll need
-- to ensure you have a plugin like fidget.nvim installed to handle them.
--
-- "on" will enable the custom Metals status extension and you *have* to have
-- a have settings to capture this in your statusline or else you'll not see
-- any messages from metals. There is more info in the help docs about this
metals_config.init_options.statusBarProvider = "on"
metals_config.cmd = vim.fn.stdpath("cache") .. "/nvim/nvim-metals/metals"

-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
-- metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()

  require 'core.functions'.set_mappings(
    {
      n = { ["<leader>lw"] = { require("metals").hover_worksheet(), "" }, }
    }
  )
end

vim.lsp.config('metals', metals_config)
