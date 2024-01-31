return {
	{ -- neogit // to be tested
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		opts = {},
	},
	--[[
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
  },
  --]]
}
