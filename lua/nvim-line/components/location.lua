local M = {}

function M.get()
	return string.format("%3d:%-2d", vim.fn.line("."), vim.fn.charcol("."))
end

return M
