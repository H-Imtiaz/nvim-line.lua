local M = {
	count = { 0, 0, 0, 0 },
	signs = {
		Error = "●",
		Warn = "●",
		Info = "●",
		Hint = "●",
	},
}

-- local diagnostic_config = vim.diagnostic.config()
--
-- if diagnostic_config ~= nil then
-- 	Diagnostics.signs.Error = diagnostic_config.signs.text[1]
-- 	Diagnostics.signs.Warn = diagnostic_config.signs.text[2]
-- 	Diagnostics.signs.Info = diagnostic_config.signs.text[3]
-- 	Diagnostics.signs.Hint = diagnostic_config.signs.text[4]
-- end

function M:new(opts)
	local instance = require("nvim-line.component")()

	instance.content = function()
		local result = ""

		if M.count[1] > 0 then
			result = result .. "%#DiagnosticSignError#" .. M.signs.Error .. " " .. M.count[1] .. "%#NSNormalStatus# "
		end

		if M.count[2] > 0 then
			result = result .. "%#DiagnosticSignWarn#" .. M.signs.Warn .. " " .. M.count[2] .. "%#NSNormalStatus# "
		end

		if M.count[3] > 0 then
			result = result .. "%#DiagnosticSignInfo#" .. M.signs.Info .. " " .. M.count[3] .. "%#NSNormalStatus# "
		end

		if M.count[4] > 0 then
			result = result .. "%#DiagnosticSignHint#" .. M.signs.Hint .. " " .. M.count[4] .. "%#NSNormalStatus#"
		end

		return result
	end

	instance.separator = opts.separator
	instance.section = opts.section
	instance.highlight = opts.highlight

	instance.update = function()
		local diagnostics = require("nvim-line.components.diagnostics")
		M.count = { 0, 0, 0, 0 }

		for _, diagnostic in ipairs(vim.diagnostic.get(nil)) do
			diagnostics.count[diagnostic.severity] = diagnostics.count[diagnostic.severity] + 1
		end

		instance:update_hl()
	end

	return instance
end

return M
