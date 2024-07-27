math.randomseed(os.time())

vim.g.mapleader = " "

local opt = vim.opt

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

opt.number = true
opt.relativenumber = false
opt.spelllang = { "en", "fr" }
opt.termguicolors = true

require("core.mappings")
require("config.lazy")

vim.opt.clipboard = "unnamedplus"
vim.cmd.colorscheme("gruvbox")

vim.cmd([[
function OpenMarkdownPreview (url)
if system("ps -e | grep -c firefox")>= 1
execute "silent ! firefox-developer-edition --new-window " . a:url
else
echo system("firefox-developer-edition &")
execute "silent ! firefox-developer-edition " . a:url
endif
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]])

-- vim.api.nvim_set_var("mkdp_browser", "firefox-developer-edition")

vim.filetype.add({
	extension = { rasi = "rasi" },
	pattern = {
		[".*/kitty/*.conf"] = "bash",
		[".*/hypr/.*%.conf"] = "hyprlang",
	},
})
