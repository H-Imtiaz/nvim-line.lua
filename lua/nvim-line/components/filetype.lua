local M = {}

function M:new(opts)
	local instance = require("nvim-line.component")()

	instance.content = function()
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

	instance.separator = opts.separator
	instance.section = opts.section
	instance.highlight = opts.highlight

	instance.update = function()
		instance:update_hl()
	end

	return instance
end

return M
