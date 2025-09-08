local keys = {
  n = {
    ["<Down>"] = { function() require("dap").step_over() end, "Step over", },
    ["<S-Down>"] = { function() require("dap").continue() end, "Continue", },
    ["<CR>"] = { function() require("dap").step_into() end, "Step into", },
    ["<Esc>"] = { function() require("dap").step_out() end, "Step out", },
    ["<S-w>"] = { "<cmd>DapViewWatch<cr>", "Watch" },
  }
}

return {
  {
    "igorlfs/nvim-dap-view",
    ---@module 'dap-view'
    ---@type dapview.Config
    opts = { auto_toggle = true, },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = { "igorlfs/nvim-dap-view", "jay-babu/mason-nvim-dap.nvim" },

    cmd = { "Dap" },
    keys = {
      { "<leader>dc", function() require("dap").continue() end,          "n", desc = "Continue" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, "n", desc = "Set breakpoint", },
      { "<leader>dk", function() require("dap").terminate() end,         "n", desc = "Terminate", },
      {
        "<leader>du",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "), nil, nil)
        end,
        "n",
        desc = "Set conditional breakpoint"
      },
    },

    config = function()
      local dap = require('dap')

      dap.adapters.codelldb = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/bin/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
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

      vim.fn.sign_define(
        "DapLogPoint",
        { text = "", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" }
      )

      vim.fn.sign_define(
        "DapStopped",
        { text = "", linehl = "debugPC", numhl = "debugPC", }
      )

      require("core.functions").set_mappings(require("core.mappings").dap)

      dap.listeners.before["event_initialized"]["mappings"] = function()
        require("core.functions").set_mappings(keys)
      end

      dap.listeners.before["event_terminated"]["mappings"] = function()
        require("core.functions").del_mappings(keys)
      end
    end
  },
}
