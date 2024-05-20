require("md-pdf").setup({
	margins = "1.5cm",
	highlight = "tango",
	toc = true,
	preview_cmd = function()
		return "firefox-developer-edition"
	end,
	ignore_viewer_state = false,
})

-- setup mapping
vim.keymap.set("n", "<Space>,", function()
	require("md-pdf").convert_md_to_pdf()
end)
