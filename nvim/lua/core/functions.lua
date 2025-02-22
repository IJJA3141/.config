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
	local function tokenize(str)
		local tokens = {}
		local index = 1
		local start_index = 1
		local end_index

		while index < 15 do -- safe guard
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

	local function get_return_type(line)
		local is_key_word = false
		local key_words = {
			"",
      "record",
			"abstract",
			"default",
			"final",
			"native",
			"private",
			"public",
			"protected",
			"static",
			"synchronized",
			"void",
		}

		local start_ptr = 1
		while line:sub(start_ptr, start_ptr) == " " do
			start_ptr = start_ptr + 1
		end

		local end_ptr = line:find(" ", start_ptr)

		while end_ptr do
			is_key_word = false
			local str = line:sub(start_ptr, end_ptr - 1)

			for _, key_word in ipairs(key_words) do
				if str == key_word then
					is_key_word = true
					break
				end
			end

			if not is_key_word then
				return str
			end

			start_ptr = end_ptr + 1
			while line:sub(start_ptr, start_ptr) == " " do
				start_ptr = start_ptr + 1
			end

			end_ptr = line:find(" ", start_ptr + 1)
		end

		local str = line:sub(start_ptr)
		is_key_word = false

		for _, key_word in ipairs(key_words) do
			if str == key_word then
				is_key_word = true
				break
			end
		end

		if not is_key_word then
			return str
		end

		return nil
	end

	local key_words = { "class", "interface", "enum" } -- record is treated like a funciton
	local prompt = {}
	local index = 0

	prompt.authors = { "Estella Alex (398261)" }
	prompt.is_method = true
	prompt.is_typed = true
	prompt.padding = ""
	prompt.throws = {}
	prompt.tokens = {}

	-- ┌── x
	-- │
	-- y
	local y = vim.api.nvim_win_get_cursor(0)[1] - 1
	local current_line = vim.api.nvim_buf_get_lines(0, y, y + 1, true)[1]

	while current_line:sub(#prompt.padding + 1, #prompt.padding + 1) == " " do
		prompt.padding = prompt.padding .. " "
	end

	for _, key_word in ipairs(key_words) do
		if current_line:find(key_word) then
			prompt.is_method = false
			break
		end
	end

	if prompt.is_method then
		while not current_line:find("{") and not current_line:find(";") do
			if index > 10 then
				return
			end -- safe guard

			index = index + 1
			current_line = current_line .. vim.api.nvim_buf_get_lines(0, y + index, y + index + 1, false)[1]
		end

		local start_ptr = current_line:find("%(")
		local end_ptr = current_line:find("%)")

		if not start_ptr or not end_ptr or start_ptr > end_ptr then
			return
		end -- mal formed parametter

		local type_ptr = start_ptr - 1
		while current_line:sub(type_ptr, type_ptr) ~= " " do
			type_ptr = type_ptr - 1
		end

		prompt.return_type = get_return_type(current_line:sub(1, type_ptr))
		prompt.tokens = tokenize(current_line:sub(start_ptr + 1, end_ptr - 1)) or {}

		start_ptr = select(2, current_line:find("throws"))

		if start_ptr then
			start_ptr = start_ptr + 2

			while current_line:sub(start_ptr, start_ptr + 1) == " " do
				start_ptr = start_ptr + 1
			end

			end_ptr = current_line:find(",", start_ptr)
			while end_ptr do
				table.insert(prompt.throws, current_line:sub(start_ptr, end_ptr - 1))

				start_ptr = end_ptr + 2
				end_ptr = current_line:find(",", start_ptr)
			end

			table.insert(
				prompt.throws,
				(current_line:sub(start_ptr, (current_line:find("{") or current_line:find(";")) - 2))
			)
		end
	end

	local str = { prompt.padding .. "/**", prompt.padding .. " * " }
	index = #str + 1

	if #prompt.authors > 0 then
		str[index] = prompt.padding .. " * "
		index = index + 1

		for _, author in ipairs(prompt.authors) do
			str[index] = prompt.padding .. " * @author " .. author
			index = index + 1
		end
	end

	if prompt.is_method then
		if #prompt.tokens > 0 then
			str[index] = prompt.padding .. " *"
			index = index + 1

			for _, token in ipairs(prompt.tokens) do
				str[index] = prompt.padding .. " * @param " .. token.var
				if prompt.is_typed then
					str[index] = str[index] .. "(" .. token.type .. ")"
				end
				str[index] = str[index] .. ": "

				index = index + 1
			end
		end

		if #prompt.throws > 0 then
			str[index] = prompt.padding .. " *"
			index = index + 1

			for _, throw in ipairs(prompt.throws) do
				str[index] = prompt.padding .. " * @throws " .. throw .. ": "
				index = index + 1
			end
		end

		if prompt.return_type then
			str[index] = prompt.padding .. " *"
			index = index + 1
			str[index] = prompt.padding .. " * @return "
			if prompt.is_typed then
				str[index] = str[index] .. "(" .. prompt.return_type .. "): "
				index = index + 1
			end
		end
	end

	str[index] = prompt.padding .. " */"

	vim.api.nvim_buf_set_lines(0, y, y, false, str)
	vim.cmd("startinsert")
	vim.api.nvim_win_set_cursor(0, { y + 2, #str[2] })
end

return M
