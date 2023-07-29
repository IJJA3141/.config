local plugins = {
  {
    "vim-crystal/vim-crystal",
    ft = "crystal",
    config = function(_)
      vim.g.crystal_auto_format = 1
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "NvChad.configs.lspconfig"
    end,
  },
  {
    "lervag/vimtex",
    lazy = false,
  },
  {
    "IJJA3141/vim-Freshfox",
    config = function()
      require "NvChad.configs.vim-Freshfox"
    end,
    lazy = true,
    ft = { 'tex' }
  },
}

return plugins
