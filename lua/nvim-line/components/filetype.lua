local M = {}

function M.get()
	local devicons = pcall(require, "nvim-web-devicons")

	if devicons == nil then
		return ""
	end

	local icon, highlight = require("nvim-web-devicons").get_icon_by_filetype(vim.bo.filetype)

	if icon == nil and highlight == nil then
		icon = ""
		highlight = "DevIconDefault"
	end

	return icon
end

return M
