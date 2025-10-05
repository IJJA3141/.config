return {
  {
    "mason-org/mason.nvim",
    cmd = { "Mason" },
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig", },

    event = { "BufReadPre", "BufNewFile" },
    ---@module "mason-lspconfig"
    ---@type MasonLspconfigSettings
    opts = {
      ensure_installed = {
        "lua_ls",
        "clangd",
        "neocmake",
        "jdtls",
      },

      -- automatic_enable = { exclude = { "jdtls" } }
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap", },
    opts = {
      ensure_installed = {
        "codelldb",
        "javatest",
        "javadbg",
      }
    },
  }
}
