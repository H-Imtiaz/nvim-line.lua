local M = {}

local config = require("nvim-line.config")
local preconfigured = {
	normal = "",
	insert = "",
	visual = "",
	replace = "",
	command = "",
	terminal = "",
}

--- @param mode "n"|"Insert"|"Visual"|"Replace"|"Command"|"Terminal"
local function refresh(mode)
	vim.opt.laststatus = 3

	if mode == "n" then
		vim.opt.statusline = preconfigured.normal
	end

	if mode == "i" then
		vim.opt.statusline = preconfigured.insert
	end

	if mode == "v" then
		vim.opt.statusline = preconfigured.visual
	end

	if mode == "r" then
		vim.opt.statusline = preconfigured.replace
	end

	if mode == "c" then
		vim.opt.statusline = preconfigured.command
	end

	if mode == "t" then
		vim.opt.statusline = preconfigured.terminal
	end
end

-- @param opts NvimLineConfig
function M.setup(opts)
	config = vim.tbl_deep_extend("force", config, opts or {})
	local utils = require("nvim-line.utils")

	for _, component in pairs(config.sections.a) do
		local name = "nvim_line_" .. component[1]
		vim.g[name] = require("nvim-line.components." .. component[1])

		preconfigured.normal = preconfigured.normal .. utils.set_component_left("a", name, config.separators.left, "n")
		preconfigured.insert = preconfigured.insert .. utils.set_component_left("a", name, config.separators.left, "i")
		preconfigured.visual = preconfigured.visual .. utils.set_component_left("a", name, config.separators.left, "v")

		preconfigured.replace = preconfigured.replace
			.. utils.set_component_left("a", name, config.separators.left, "r")
		preconfigured.command = preconfigured.command
			.. utils.set_component_left("a", name, config.separators.left, "c")
		preconfigured.terminal = preconfigured.terminal
			.. utils.set_component_left("a", name, config.separators.left, "t")
	end

	for _, component in pairs(config.sections.b) do
		local name = "nvim_line_" .. component[1]
		vim.g[name] = require("nvim-line.components." .. component[1])

		preconfigured.normal = preconfigured.normal .. utils.set_component_left("b", name, config.separators.left, "n")
		preconfigured.insert = preconfigured.insert .. utils.set_component_left("b", name, config.separators.left, "i")
		preconfigured.visual = preconfigured.visual .. utils.set_component_left("b", name, config.separators.left, "v")

		preconfigured.replace = preconfigured.replace
			.. utils.set_component_left("b", name, config.separators.left, "r")
		preconfigured.command = preconfigured.command
			.. utils.set_component_left("b", name, config.separators.left, "c")
		preconfigured.terminal = preconfigured.terminal
			.. utils.set_component_left("b", name, config.separators.left, "t")
	end

	for _, component in pairs(config.sections.c) do
		local name = "nvim_line_" .. component[1]
		vim.g[name] = require("nvim-line.components." .. component[1])

		preconfigured.normal = preconfigured.normal .. utils.set_component_left("c", name, config.separators.left, "n")
		preconfigured.insert = preconfigured.insert .. utils.set_component_left("c", name, config.separators.left, "i")
		preconfigured.visual = preconfigured.visual .. utils.set_component_left("c", name, config.separators.left, "v")

		preconfigured.replace = preconfigured.replace
			.. utils.set_component_left("c", name, config.separators.left, "r")
		preconfigured.command = preconfigured.command
			.. utils.set_component_left("c", name, config.separators.left, "c")
		preconfigured.terminal = preconfigured.terminal
			.. utils.set_component_left("c", name, config.separators.left, "t")
	end

	preconfigured.normal = preconfigured.normal .. "%="
	preconfigured.insert = preconfigured.insert .. "%="
	preconfigured.visual = preconfigured.visual .. "%="
	preconfigured.replace = preconfigured.replace .. "%="
	preconfigured.command = preconfigured.command .. "%="
	preconfigured.terminal = preconfigured.terminal .. "%="

	for _, component in pairs(config.sections.x) do
		local name = "nvim_line_" .. component[1]
		vim.g[name] = require("nvim-line.components." .. component[1])

		preconfigured.normal = preconfigured.normal
			.. utils.set_component_right("c", name, config.separators.right, "n")

		preconfigured.insert = preconfigured.insert
			.. utils.set_component_right("c", name, config.separators.right, "i")

		preconfigured.visual = preconfigured.visual
			.. utils.set_component_right("c", name, config.separators.right, "v")

		preconfigured.replace = preconfigured.replace
			.. utils.set_component_right("c", name, config.separators.right, "r")

		preconfigured.command = preconfigured.command
			.. utils.set_component_right("c", name, config.separators.right, "c")

		preconfigured.terminal = preconfigured.terminal
			.. utils.set_component_right("c", name, config.separators.right, "t")
	end

	for _, component in pairs(config.sections.y) do
		local name = "nvim_line_" .. component[1]
		vim.g[name] = require("nvim-line.components." .. component[1])

		preconfigured.normal = preconfigured.normal
			.. utils.set_component_right("b", name, config.separators.right, "n")

		preconfigured.insert = preconfigured.insert
			.. utils.set_component_right("b", name, config.separators.right, "i")

		preconfigured.visual = preconfigured.visual
			.. utils.set_component_right("b", name, config.separators.right, "v")

		preconfigured.replace = preconfigured.replace
			.. utils.set_component_right("b", name, config.separators.right, "r")

		preconfigured.command = preconfigured.command
			.. utils.set_component_right("b", name, config.separators.right, "c")

		preconfigured.terminal = preconfigured.terminal
			.. utils.set_component_right("b", name, config.separators.right, "t")
	end

	for _, component in pairs(config.sections.z) do
		local name = "nvim_line_" .. component[1]
		vim.g[name] = require("nvim-line.components." .. component[1])

		preconfigured.normal = preconfigured.normal
			.. utils.set_component_right("a", name, config.separators.right, "n")

		preconfigured.insert = preconfigured.insert
			.. utils.set_component_right("a", name, config.separators.right, "i")

		preconfigured.visual = preconfigured.visual
			.. utils.set_component_right("a", name, config.separators.right, "v")

		preconfigured.replace = preconfigured.replace
			.. utils.set_component_right("a", name, config.separators.right, "r")

		preconfigured.command = preconfigured.command
			.. utils.set_component_right("a", name, config.separators.right, "c")

		preconfigured.terminal = preconfigured.terminal
			.. utils.set_component_right("a", name, config.separators.right, "t")
	end

	require("nvim-line.highlight")
end

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	group = vim.api.nvim_create_augroup("nvim-line", { clear = false }),
	callback = function()
		refresh(vim.api.nvim_get_mode().mode:sub(1, 1):lower())
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("nvim-line", { clear = false }),
	callback = function()
		print(vim.bo.filetype)

		refresh(vim.api.nvim_get_mode().mode:sub(1, 1):lower())
	end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
	group = vim.api.nvim_create_augroup("nvim-line", { clear = false }),
	callback = function()
		refresh(vim.api.nvim_get_mode().mode:sub(1, 1):lower())
	end,
})

return M
