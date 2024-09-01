local cmp = require("cmp")
local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

cmp.setup({
	completion = { completeopt = "menu,menuone" },
	window = {
		completion = { winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel", scrollbar = false },
		documentation = { border = border("CmpDocBorder"), winhighlight = "Normal:CmpDoc" },
	},
	sources = {
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "async_path" },
	},
	mapping = {
		["<S-Tab>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
		["<S-Enter>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<C-Enter>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
})
