local M = {}

--- @class NvimLineConfig
M = {
	sections = {
		a = { { "mode" } },
		b = { { "branch" } },
		c = { { "diagnostics" } },
		x = { { "filetype" } },
		y = { { "progress" } },
		z = { { "location" } },
	},
	separators = {
		left = "",
		right = "",
	},
}

return M
