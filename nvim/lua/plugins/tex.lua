return {
	{
		"lervag/vimtex",
		ft = "tex",
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = { "VimtexEventCompileSuccess" },
				callback = function()
					vim.fn.system("hyprctl dispatch sendshortcut ,f5,firefox-developer-edition", "")
				end,
			})

			-- vim.g.vimtex_compiler_latexmk = {
			-- 	aux_dir = "",
			-- 	out_dir = "",
			-- 	callback = 1,
			-- 	continuous = 1,
			-- 	executable = "latexmk",
			-- 	options = {
			-- 		{
			-- 			"-xelatex",
			-- 			"-verbose",
			-- 			"-file-line-error",
			-- 			"-synctex=1",
			-- 			"-interaction=nonstopmode",
			-- 		},
			-- 	},
			-- }
		end,
	},
}
