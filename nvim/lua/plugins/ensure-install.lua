return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        --Lua
        "lua_ls",

        --Cpp
        "clangd",
        "cmake",

        --Ts/Js
        "tsserver",

        --Python
        "pylsp",
      },
    },
  },

  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "nvimtools/none-ls.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    require("config.null-ls")
  end,

  opts = {
    automatic_installation = true,
    ensure_installed = {
      --Lua
      "luacheck",
      "stylua",

      --Cpp
      "clang-format",
      "cpplint",

      --Ts/Js
      "prettier",
      "ts-standard",

      --Sh/Zsh/Bash
      "shellcheck",
      "beautysh",
      "bashls",

      --Python
      "black",
    },
  },
}
