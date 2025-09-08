return {
  "IJJA3141/nvim-cmk",

  ---@module 'nvim-cmk'
  ---@type cmk.opts
  opts = {
    win_config = {
      anchor = "NW",
      col = -1
    }
  },

  ft = { "cpp", "cmake" },

  config = function()
    local keys = {
      n = {
        ["<leader>cg"] = { "<cmd>CMakeGenerate<cr>", "Cmk generate" },
        ["<leader>cb"] = { "<cmd>CMakeBuild<cr>", "Cmk build" },

        ["<leader>ct"] = { "<cmd>CMakeTest<cr>", "Cmk current test" },
        ["<leader>cT"] = { "<cmd>CMakeTestAll<cr>", "Cmk test all" },

        ["<leader>cd"] = { "<cmd>CMakeDebug<cr>", "Cmk debug" },
        ["<leader>cD"] = { "<cmd>CMakeDebugTest<cr>", "Cmk debug all" },
      }
    }

    require("core.functions").set_mappings(keys)
  end
}
