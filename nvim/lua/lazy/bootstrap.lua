local M = {}
M.lazy = function(install_path)
	vim.fn.system({
    	"git",
    	"clone",
    	"--filter=blob:none",
    	"https://github.com/folke/lazy.nvim.git",
    	"--branch=stable", -- latest stable release
    	install_path,
  	})
end
return M
