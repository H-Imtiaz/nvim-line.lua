local M = {}

local config = require("nvim-line.config")
local components = {}

local function refresh(mode) end

P = function(any)
	print(vim.inspect(any))
end

Unload = function(name)
	package.loaded[name] = nil
end

function M.setup(opts)
	local map = { a = "a", b = "b", c = "hc", x = "c", y = "b", z = "a" }
	config = vim.tbl_deep_extend("force", config, opts or {})
	require("nvim-line.highlight")

	for key, value in pairs(config.sections) do
		if value == nil then
		else
			local class = require("nvim-line.components." .. value[1])
			local separator = nil

			if key ~= "c" and key ~= "x" then
				if key < "x" then
					separator = config.separators.left
				else
					separator = config.separators.right
				end
			end

			local component = class:new({
				section = key,
				highlight = {
					content = "NSNormalSection" .. map[key]:upper(),
					separator = "NSNormalSeparator" .. map[key]:upper(),
					icon = "NSNormalSection" .. map[key]:upper(),
					default = "NSNormalStatus",
				},
				separator = separator,
			})

			components[key] = component
		end
	end

	vim.opt.laststatus = 3

	for key, _ in pairs(map) do
		if components[key] == nil then
			vim.g["section" .. key:upper()] = function()
				return ""
			end
		else
			vim.g["section" .. key:upper()] = function()
				return components[key]:get_formated()
			end
		end
	end

	vim.opt.statusline =
		"%{%g:sectionA()%}%{%g:sectionB()%}%{%g:sectionC()%}%=%{%g:sectionX()%}%{%g:sectionY()%}%{%g:sectionZ()%}"
end

vim.api.nvim_create_autocmd({
	"BufEnter",
	"ModeChanged",
	"DiagnosticChanged",
	"DirChanged",
}, {
	callback = function()
		for _, component in pairs(components) do
			component:update()
		end

		vim.opt.statusline =
			"%{%g:sectionA()%}%{%g:sectionB()%}%{%g:sectionC()%}%=%{%g:sectionX()%}%{%g:sectionY()%}%{%g:sectionZ()%}"
	end,
})

-- M.setup({})

return M
