return {
	{
		"IJJA3141/ColorBoard.nvim",
		dependencies = { "m00qek/baleia.nvim" },
		event = "VimEnter",
		config = function()
			require("core.dashboard")
		end,
		init = function()
			vim.opt.laststatus = 0
		end,
	},
	{
		"folke/which-key.nvim",
		dependencies = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
	},
	{
		"shortcuts/no-neck-pain.nvim",
		cmd = { "NoNeckPain" },
		opts = {
			minSideBufferWidth = 35,
			width = 120,
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("colorizer").setup({ "*" })
		end,
	},
	{
		"echasnovski/mini.indentscope",
		event = "BufRead",
		opts = {
			symbol = "|",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"oil",
					"lazy",
					"mason",
					"dashboard",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		opts = {
signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' }, changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable = true,
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
    },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "BufRead",
		opts = {
      options = {
            theme = function ()
              local colors = require("gruvbox").palette
              return {
                normal = {
                  a = { bg = "NONE", fg = colors.light4, gui = "bold" },
                  c = { bg = "NONE", fg = colors.light4 },
                },
                insert = {
                  a = { bg = "None", fg = colors.bright_blue, gui = "bold" },
                  b = { bg = "None", fg = colors.light4 },
                  c = { bg = "None", fg = colors.light4 },
                },
                visual = {
                  a = { bg = "None", fg = colors.bright_yellow, gui = "bold" },
                  b = { bg = "None", fg = colors.light4 },
                  c = { bg = "None", fg = colors.light4 },
                },
                replace = {
                  a = { bg = "None", fg = colors.bright_red, gui = "bold" },
                  b = { bg = "None", fg = colors.light4 },
                  c = { bg = "None", fg = colors.light4 },
                },
                command = {
                  a = { bg = "None", fg = colors.bright_green, gui = "bold" },
                  b = { bg = "None", fg = colors.light4 },
                  c = { bg = "None", fg = colors.light4 },
                },
                inactive = {
                  a = { bg = "None", fg = colors.light4, gui = "bold" },
                  b = { bg = "None", fg = colors.light4 },
                  c = { bg = "None", fg = colors.light4 },
                },
              }
            end,
            -- globalstatus = true,
            section_separators = "",
            component_separators = "",
            disabled_filetypes = { statusline = { "dashboard", "lazy" } },
				    refresh = { statusline = 100, },
          },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = { "branch",
                      { "diff", source = function()
                         local gitsigns = vim.b.gitsigns_status_dict
                         if gitsigns then return {
                           added = gitsigns.added,
                           modified = gitsigns.changed,
                           removed = gitsigns.removed, }
                         end
                       end,
                       colored = true,
                       always_visible = false, },
                      "%=",
                      {"filename",symbols = { modified = '', readonly = "" } },
                      { "diagnostics", sources = { "nvim_diagnostic" },
                                       sections = { "error", "warn", "info", "hint" },
                                       colored = true, }
                    },
        lualine_x = { "encoding", "filetype" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
}
