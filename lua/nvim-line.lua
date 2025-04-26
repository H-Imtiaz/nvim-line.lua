local M = {}

local config = require("nvim-line.config")
local preconfigured = {
	normal = {
		sections = {
			a = {},
			b = {},
			c = {},
			x = {},
			y = {},
			z = {},
		},
	},
}

--- @param mode "Normal"|"Insert"|"Visual"|"Replace"|"Command"|"Terminal"
local function refresh(mode)
	-- vim.g.ns_mode = require("nvim-line.components.mode")
	-- Location = require("nvim-line.components.location")
	-- Progress = require("nvim-line.components.progress")
	-- Filetype = require("nvim-line.components.filetype")
	-- Branch = require("nvim-line.components.branch")
	-- Diagnostics = require("nvim-line.components.diagnostics")

	vim.opt.statusline = ""
	vim.opt.laststatus = 3

	if mode == "Normal" then
		for i, _ in pairs(preconfigured.normal.sections.a) do
			vim.opt.statusline:append(preconfigured.normal.sections.a[i])
		end
		for i, _ in pairs(preconfigured.normal.sections.b) do
			vim.opt.statusline:append(preconfigured.normal.sections.b[i])
		end
		for i, _ in pairs(preconfigured.normal.sections.c) do
			vim.opt.statusline:append(preconfigured.normal.sections.c[i])
		end

		vim.opt.statusline:append("%=")

		for i, _ in pairs(preconfigured.normal.sections.x) do
			vim.opt.statusline:append(preconfigured.normal.sections.x[i])
		end

		for i, _ in pairs(preconfigured.normal.sections.y) do
			vim.opt.statusline:append(preconfigured.normal.sections.y[i])
		end

		for i, _ in pairs(preconfigured.normal.sections.z) do
			vim.opt.statusline:append(preconfigured.normal.sections.z[i])
		end
	end
end

-- @param opts NvimLineConfig
function M.setup(opts)
	config = vim.tbl_deep_extend("force", config, opts or {})

	for i, component in pairs(config.sections.a) do
		local name = "nvim_line_" .. component[i]
		vim.g[name] = require("nvim-line.components." .. component[i])

		preconfigured.normal.sections.a[i] = "%#NSNormalSectionA# %{%g:"
			.. name
			.. ".get()%} %#StatusLineSeparatorA#"
			.. config.separators.left
			.. "%#Normal#"
	end

	for i, component in pairs(config.sections.b) do
		local name = "nvim_line_" .. component[i]
		vim.g[name] = require("nvim-line.components." .. component[i])

		preconfigured.normal.sections.b[i] = "%#NSNormalSectionB# %{%g:"
			.. name
			.. ".get()%} %#StatusLineSeparatorB#"
			.. config.separators.left
			.. "%#Normal#"
	end

	for i, component in pairs(config.sections.c) do
		local name = "nvim_line_" .. component[i]
		vim.g[name] = require("nvim-line.components." .. component[i])

		preconfigured.normal.sections.c[i] = "%#NSNormalSectionB# %{%g:"
			.. name
			.. ".get()%} %#StatusLineSeparatorB#"
			.. config.separators.left
			.. "%#Normal#"
	end

	for i, component in pairs(config.sections.x) do
		local name = "nvim_line_" .. component[i]
		vim.g[name] = require("nvim-line.components." .. component[i])

		preconfigured.normal.sections.x[i] = "%#StatusLineSeparatorA#"
			.. config.separators.right
			.. "%#NSNormalSectionA# %{%g:"
			.. name
			.. ".get()%} %#Normal#"
	end

	for i, component in pairs(config.sections.y) do
		local name = "nvim_line_" .. component[i]
		vim.g[name] = require("nvim-line.components." .. component[i])

		preconfigured.normal.sections.y[i] = "%#StatusLineSeparatorB#"
			.. config.separators.right
			.. "%#NSNormalSectionB# %{%g:"
			.. name
			.. ".get()%} %#Normal#"
	end

	for i, component in pairs(config.sections.z) do
		local name = "nvim_line_" .. component[i]
		vim.g[name] = require("nvim-line.components." .. component[i])

		preconfigured.normal.sections.z[i] = "%#StatusLineSeparatorA#"
			.. config.separators.right
			.. "%#NSNormalSectionA# %{%g:"
			.. name
			.. ".get()%} %#Normal#"
	end

	require("nvim-line.highlight")
	refresh("Normal")
end

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	group = vim.api.nvim_create_augroup("nvim-line", { clear = false }),
	callback = function()
		refresh("Normal")
	end,
})

return M
