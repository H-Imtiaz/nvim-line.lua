local M = {
	count = { 0, 0, 0, 0 },
	signs = {
		Error = "󰅚",
		Warn = "󰀪",
		Info = "󰋽",
		Hint = "󰌶",
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

function M.get()
	local result = ""

	if M.count[1] > 0 then
		result = result .. "%#DiagnosticSignError#" .. M.signs.Error .. " " .. M.count[1] .. "%#Normal# "
	end

	if M.count[2] > 0 then
		result = result .. "%#DiagnosticSignWarn#" .. M.signs.Warn .. " " .. M.count[2] .. "%#Normal# "
	end

	if M.count[3] > 0 then
		result = result .. "%#DiagnosticSignInfo#" .. M.signs.Info .. " " .. M.count[3] .. "%#Normal# "
	end

	if M.count[4] > 0 then
		result = result .. "%#DiagnosticSignHint#" .. M.signs.Hint .. " " .. M.count[4] .. "%#Normal#"
	end

	return result
end

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	group = vim.api.nvim_create_augroup("nvim-line", { clear = false }),
	callback = function()
		local diagnostics = require("nvim-line.components.diagnostics")
		M.count = { 0, 0, 0, 0 }

		for _, diagnostic in ipairs(vim.diagnostic.get(0)) do
			diagnostics.count[diagnostic.severity] = diagnostics.count[diagnostic.severity] + 1
		end
	end,
})

return M
