local M = {
	directory = nil,
	branch = nil,
}

function M:update_branch()
	self.directory = vim.fn.getcwd()

	local path = table.concat({ self.directory, ".git", "HEAD" }, "/")
	local file = io.open(path)

	if file == nil then
		M.branch = nil
		return
	end

	self.branch = file:read():match("ref: refs/heads/(.+)$")

	file:close()
end

vim.api.nvim_create_autocmd({ "BufEnter", "DirChanged" }, {
	group = vim.api.nvim_create_augroup("nvim-line", { clear = false }),
	callback = function()
		M:update_branch()
	end,
})

function M:new(opts)
	local instance = require("nvim-line.component")()

	instance.content = function()
		if M.branch == nil then
			return nil
		end

		return " " .. M.branch
	end

	instance.separator = opts.separator
	instance.section = opts.section
	instance.highlight = opts.highlight

	instance.update = function()
		M:update_branch()
		instance:update_hl()
	end

	return instance
end

return M
