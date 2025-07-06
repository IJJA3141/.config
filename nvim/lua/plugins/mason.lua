return {
	{
		"williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
		  "jay-babu/mason-nvim-dap.nvim",
    },
    lazy = false,
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          "lua_ls",
          "cmake",
          "clangd",
          "html",
          "cssls",
          "jsonls",
          "pylsp",
          "bashls",
          "jdtls",
          "texlab",
          "gopls",
          "verible",
        },
      })
      require("mason-nvim-dap").setup({
        automatic_installation = true,
        ensure_installed = {
          "cppdbg",
          "javatest",
          "javadbg",
          "delve",
        },
      })
    end,
	},
}
