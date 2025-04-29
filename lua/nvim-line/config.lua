local M = {}

---@class NSComponentSection
---@field a string|table
---@field b string|table
---@field c string|table
---@field x string|table
---@field y string|table
---@field z string|table
local Section = {
	a = {},
	b = {},
	c = {},
	x = {},
	y = {},
	z = {},
}

--- @class NvimLineConfig
--- @field sections NSComponentSection
M = {
	sections = {
		a = { "mode" },
		b = { "branch" },
		c = { "diagnostics" },
		x = { "filetype" },
		y = { "progress" },
		z = { "location" },
	},
	separators = {
		left = "",
		right = "",
	},
}

return M
