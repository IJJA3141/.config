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
        "verible",
        "gopls",
        "bashls",
        "basedpyright",
        "vtsls",
        "cssls",
        "html",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim", },
    opts = {
      ensure_installed = {
        "black",
        "prettierd",
        "markuplint",
      },
      automatic_installation = false,
      handlers = {},
    }
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap", },
    opts = {
      ensure_installed = {
        "codelldb",
        "javatest",
        "javadbg",
        "delve",
      }
    },
  }
}
