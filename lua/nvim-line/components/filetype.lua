local M = {}

function M.get()
	local devicons = require("nvim-web-devicons")
	local icon, highlight = devicons.get_icon(vim.fn.expand("%:t"))

	if icon == nil and highlight == nil then
		icon, highlight = devicons.get_icon_by_filetype(vim.bo.filetype)
	end

	if icon == nil and highlight == nil then
		icon = ""
		highlight = "DevIconDefault"
	end

	return "%#" .. highlight .. "#" .. icon .. " " .. vim.bo.filetype .. "%#NSNormalStatus#"
end

return M
