vim.g.mapleader = " "

-- line number
vim.opt.relativenumber = false
vim.opt.number = true

-- tabs && indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.autoindent = true

-- style
vim.opt.termguicolors = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- spelling
vim.opt.spelllang = { "en", "fr" }

vim.opt.clipboard = "unnamedplus"
vim.filetype.add({
	extension = { rasi = "rasi" },
	pattern = {
		[".*/kitty/*.conf"] = "bash",
		[".*/hypr/.*%.conf"] = "hyprlang",
	},
})
