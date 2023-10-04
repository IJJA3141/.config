package.path = '~/.config/nvim/?.lua'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("lazy.bootstrap").lazy(lazypath)
end

vim.opt.rtp:prepend(lazypath)
require('lazy').setup(require('lazy.plugins'),require('lazy.opts'))
