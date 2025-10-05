local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

return {
  {
    "mfussenegger/nvim-jdtls",
    dependencies = { "mfussenegger/nvim-dap" },

    ft = { "java" }
  },
  {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()
      metals_config.init_options.statusBarProvider = "off"
      metals_config.settings = {
        inlayHints = {
          hintsInPatternMatch = { enable = false },
          implicitArguments = { enable = true },
          implicitConversions = { enable = false },
          inferredTypes = { enable = false },
          typeParameters = { enable = false },
        },
        defaultBspToBuildTool = true,
      }

      metals_config.on_attach = function(client, bufnr)
        require("metals").setup_dap()

        require 'core.functions'.set_mappings(
          {
            n = {
              ["<leader>lw"] = { function() require("metals").hover_worksheet({ border = "single" }) end },
            }
          }
        )

        vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
          pattern = { "*.worksheet.sc" },
          callback = function() vim.lsp.inlay_hint.enable(true) end,
          group = nvim_metals_group,
        })
      end

      return metals_config
    end,

    config = function(self, metals_config)
      -- vim.lsp.enable("metals")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function() require("metals").initialize_or_attach(metals_config) end,
        group = nvim_metals_group,
      })
    end,
  },
  {
    "leoluz/nvim-dap-go",

    ft = { "go" },

    opts = {
      -- Additional dap configurations can be added.
      -- dap_configurations accepts a list of tables where each entry
      -- represents a dap configuration. For more details do:
      -- :help dap-configuration
      -- dap_configurations = {
      --   {
      --     -- Must be "go" or it will be ignored by the plugin
      --     type = "go",
      --     name = "Attach remote",
      --     mode = "remote",
      --     request = "attach",
      --   },
      -- },
      -- delve configurations
      delve = {
        -- the path to the executable dlv which will be used for debugging.
        -- by default, this is the "dlv" executable on your PATH.
        path = "dlv",
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port.
        -- if you set a port in your debug configuration, its value will be
        -- assigned dynamically.
        -- port = "${port}",
        -- additional args to pass to dlv
        -- args = {},
        -- the build flags that are passed to delve.
        -- defaults to empty string, but can be used to provide flags
        -- such as "-tags=unit" to make sure the test suite is
        -- compiled during debugging, for example.
        -- passing build flags using args is ineffective, as those are
        -- ignored by delve in dap mode.
        -- avaliable ui interactive function to prompt for arguments get_arguments
        -- build_flags = {},
        -- whether the dlv process to be created detached or not. there is
        -- an issue on delve versions < 1.24.0 for Windows where this needs to be
        -- set to false, otherwise the dlv server creation will fail.
        -- avaliable ui interactive function to prompt for build flags: get_build_flags
        -- detached = vim.fn.has("win32") == 0,
        -- the current working directory to run dlv from, if other than
        -- the current working directory.
        -- cwd = nil,
      },
      -- options related to running closest test
      tests = {
        -- enables verbosity when running the test.
        verbose = false,
      },
    }
  }
}
