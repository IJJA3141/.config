return {
  "nvim-telescope/telescope.nvim",
  dependencies = { 'nvim-lua/plenary.nvim' },

  cmd = { "Telescope" },
  keys = {
    { "<leader>/",  "<cmd> Telescope live_grep <cr>",           "Telescope grep" },
    { "<leader>f", "<cmd> Telescope fd <cr>",                  "Telescope finder" },

    { "<leader>tg", "<cmd> Telescope live_grep <cr>",           "Telescope grep" },
    { "<leader>tf", "<cmd> Telescope fd <cr>",                  "Telescope finder" },
    { "<leader>td",  "<cmd> Telescope diagnostics bufnr=0 <cr>", "Diagnostics" },
    { "<leader>tD",  "<cmd> Telescope diagnostics <cr>",         "Diagnostics" },
  },
}
