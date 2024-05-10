---@class Array<T>: { [integer]: T }

---@class Button
---@field image string
---@field label string
---@field command function

---@class Row
---@field title string
---@field buttons Array<Button>

---@class Page
---@field name string
---@field image string
---@field top_button Row
---@field center_button Row
---@field bottom_button Row

---@class Config
---@field image_width integer
---@field width integer
---@field height integer
---@field use_local boolean
---@field is_overlay boolean
---@field pages Array<Page>

---@type Config
local config = {
	width = 800,
	height = 500,
	image_width = 200,
	is_overlay = true,
	use_local = false,
	entry_number = 10,

	pages = {
		{
			image = "/home/alexe/.config/iris/test.jpg",
			name = "school",
			top_button = {},
			center_button = {},
			bottom_button = {},
		},
	},
}

return config
