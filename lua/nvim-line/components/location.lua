local M = {}

function M:new(opts)
	local instance = require("nvim-line.component")()

	instance.content = function()
		return string.format("%3d:%-2d", vim.fn.line("."), vim.fn.charcol("."))
	end

	instance.separator = opts.separator
	instance.section = opts.section
	instance.highlight = opts.highlight

	instance.update = function()
		instance:update_hl()
	end

	return instance
end

return M
