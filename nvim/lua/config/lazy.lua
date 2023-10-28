--Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	ui = {
		border = "rounded",
	},
	spec = {
		{ import = "plugins" },
	},
	defaults = {
		version = false,
		lazy = false,
	},
	install = { colorscheme = { "gruvbox", "tokyonight" } },
	checker = { enabled = true }, -- automatically check for plugin updates
})