local M = {}

function M.get()
	local current = vim.fn.line(".")
	local total = vim.fn.line("$")

	return current == 1 and "Top" or (current == total and "Bot" or "%p%%")
end

return M
