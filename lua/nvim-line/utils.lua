local M = {}

local conv = {
	n = "Normal",
	i = "Insert",
	v = "Visual",
	r = "Replace",
	c = "Command",
	t = "Terminal",
}

---@param section "a"|"b"|"c"
---@param name string
---@param separator string
---@param mode "n"|"i"|"v"|"r"|"c"|"t"
function M.set_component_left(section, name, separator, mode)
	if section == "c" then
		return " %{%g:" .. name .. ".get()%} "
	end

	local hl_separator = "NS" .. conv[mode] .. "Separator" .. section:upper()
	local hl_section = "NS" .. conv[mode] .. "Section" .. section:upper()

	return "%#"
		.. hl_section
		.. "# %{%g:"
		.. name
		.. ".get()%} %#"
		.. hl_separator
		.. "#"
		.. separator
		.. "%#NSNormalStatus#"
end

---@param section "a"|"b"|"c"
---@param name string
---@param separator string
---@param mode string
function M.set_component_right(section, name, separator, mode)
	if section == "c" then
		return " %{%g:" .. name .. ".get()%} "
	end

	local hl_separator = "NS" .. conv[mode] .. "Separator" .. section:upper()
	local hl_section = "NS" .. conv[mode] .. "Section" .. section:upper()

	return "%#"
		.. hl_separator
		.. "#"
		.. separator
		.. "%#"
		.. hl_section
		.. "# %{%g:"
		.. name
		.. ".get()%} %#NSNormalStatus#"
end

return M
