local M = {}

function M:new(opts)
	local instance = require("nvim-line.component")()

	instance.content = function()
		local current = vim.fn.line(".")
		local total = vim.fn.line("$")

		return current == 1 and "Top" or (current == total and "Bot" or "%p%%")
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
