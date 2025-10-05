return {
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",

    opts = {
      bold = false,
      alpha = true,
      terminal_colors = true,
      transparent_mode = true,
      ovverrides = {
        StatusLine = { fg = "NONE", bg = "NONE" },
        StatusLineNC = { fg = "NONE", bg = "NONE" },
      }
    },

  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",

    opts = {}
  }
}
