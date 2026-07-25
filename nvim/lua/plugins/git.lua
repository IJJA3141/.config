return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen" },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim"
    },

    cmd = "Neogit",
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",

    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>ts", "<cmd> Gitsigns toggle_signs <cr>", desc = "Toggle gitsigns" },
      { "]g",         "<cmd> Gitsigns nav_hunk next<cr>", desc = "Next gitsigns" },
      { "[g",         "<cmd> Gitsigns nav_hunk prev<cr>", desc = "Previous gitsigns" }
    },

    opts = {}
  },
}
