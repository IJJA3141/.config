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

vim.opt.clipboard = 'unnamedplus'
vim.cmd.colorscheme("gruvbox")
