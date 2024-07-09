return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- Lua
        "lua_ls",

        -- Cpp
        "clangd",
        "cmake",

        -- Soydev
        "tsserver",
        "html",
        "htmx",
        "cssls",
        "jsonls",

        -- Python
        "pylsp",

        -- Shell
        "bashls",
        "cairo_ls",

        -- ?
        "dotls",
        "jqls",
        "ltex",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "nvimtools/none-ls.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },

    opts = {
      ensure_installed = {
        -- Lua
        "luacheck",
        "stylua",

        -- Cpp
        "clang-format",
        --"cpplint", annoying

        -- Ts/Js
        "prettier",
        "ts-standard",

        -- Sh/Zsh/Bash
        "shellcheck",
        "beautysh",

        -- Python
        "black",
      },
      automatic_installation = true,
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "cppdbg" },
      automatic_installation = true,
    },
  },
}
