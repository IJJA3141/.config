local M = {}

M.toggle_background = function()
	if vim.g.colors_name == "gruvbox" then
		require("gruvbox").config.transparent_mode = not require("gruvbox").config.transparent_mode
		vim.cmd("colorscheme gruvbox")
	end
end

M.setMappings = function(keysbinds, opts)
	opts = opts or {}

	for mode, binds in pairs(keysbinds) do
		for keys, func in pairs(binds) do
			opts.desc = func[2]
			vim.keymap.set(mode, keys, func[1], opts)
		end
	end
end

M.generate_javadoc = function()
	--- @class token
	--- @field type string | nil
	--- @field var string | nil

	--- @return string | nil
	local function get_header()
		--- @type integer
		local y = vim.api.nvim_win_get_cursor(0)[1] - 1
		--- @type string
		local line = vim.api.nvim_buf_get_lines(0, y, y + 1, true)[1]
		--- @type string
		local str = ""

		if not line:find("%(") then
			return
		end

		while not line:find("%)") do
			vim.print("test")

			y = y + 1
			str = str .. line
			line = vim.api.nvim_buf_get_lines(0, y, y + 1, false)[1]
			if not line then
				return
			end
		end

		return str .. line
	end

	--- @param str string
	--- @return token[] | nil
	local function tokenize(str)
		--- @type token[]
		local tokens = {}
		---@type integer
		local index = 1
		--- @type integer
		local start_index = 1
		--- @type integer | nil
		local end_index

		-- safe guard
		while index < 15 do
			while str:sub(start_index, start_index) == " " do
				start_index = start_index + 1
			end

      -- fix
			end_index = str:find(" ", start_index)
			if end_index == nil then
				return
			end

			end_index = end_index - 1
			if not end_index then
				return
			end

			tokens[index] = {}
			tokens[index].type = str:sub(start_index, end_index)

			start_index = end_index + 1

			while str:sub(start_index, start_index) == " " do
				start_index = start_index + 1
			end

			end_index = str:find(",", start_index)

			if not end_index then
				break
			end

			end_index = math.min(end_index, str:find(" ", start_index) or end_index + 1) - 1
			tokens[index].var = str:sub(start_index, end_index)

			start_index = str:find(",", end_index) + 1
			index = index + 1
		end

		tokens[index].var = str:sub(start_index, #str)

		return tokens
	end

	--- @type integer
	local y = vim.api.nvim_win_get_cursor(0)[1] - 1
	---@type string
	local padding = ""
	--- @type string
	local line = vim.api.nvim_get_current_line()

	while line:sub(#padding + 1, #padding + 1) == " " do
		padding = padding .. " "
	end

	line = get_header() or ""

	--- @type string[]
	local str = { padding .. "/**" }
	--- @type token[] | nil
	local tokens
	local size = 1

	if #line ~= 0 then
		tokens = tokenize(line:sub(line:find("%(") + 1, line:find("%)") - 1))
	end

	if tokens then
		for _, token in pairs(tokens) do
			size = size + 1
			str[size] = padding .. " * @param " .. token.var .. "(" .. token.type .. "): "
		end
	end

	str[size + 1] = padding .. " */"

	vim.api.nvim_buf_set_lines(0, y, y, false, str)
	vim.cmd("startinsert")
	vim.api.nvim_win_set_cursor(0, { y + 2, #str[size] })
end

return M
