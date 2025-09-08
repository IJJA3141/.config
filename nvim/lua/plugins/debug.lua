return {
  { -- debug
    "mfussenegger/nvim-dap",
    ft = { "cpp", "java", "go" },
    -- cmd = { "DapContinue", "DapNew", "DapToggleBreakpoint" },
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      "igorlfs/nvim-dap-view"
    },
    config = function()
      local dap = require("dap")

      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
      }

      dap.configurations.cpp = {
        {
          name = "debug",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = true,
        },
        {
          name = "test",
          type = "cppdbg",
          request = "launch",
          program = function()
            io.popen("cd " .. vim.fn.getcwd() .. "/bin/Debug/test && make")
            return vim.fn.getcwd() .. "/bin/Debug/test/unit_tests"
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = true,
        },
      }

      vim.fn.sign_define(
        "DapBreakpoint",
        { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
      )

      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "", texthl = "DiagnosticSignHint", linehl = "", numhl = "" }
      )

      vim.fn.sign_define(
        "DapBreakpointRejected",
        { text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" }
      )

      vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })

      vim.fn.sign_define("DapStopped", { text = "", linehl = "debugPC", numhl = "debugPC", })

      -- makes java bug
      -- dap.defaults.fallback.terminal_win_cmd = "horizontal belowright 15split"

      require("nvim-dap-virtual-text").setup()
      require("core.functions").setMappings(require("core.mappings").dap)
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  {
    "igorlfs/nvim-dap-view",
    opts = {
      winbar = {
        show = true,
        sections = { "watches", "exceptions", "breakpoints", "threads", "repl" },
        -- Must be one of the sections declared above
        default_section = "watches",
      },
      windows = {
        height = 12,
        terminal = {
          -- 'left'|'right': Terminal position in layout
          position = "left",
          -- List of debug adapters for which the terminal should be ALWAYS hidden
          hide = {},
          -- Hide the terminal when starting a new session
          start_hidden = false,
        },
      },
    },
  },
}
