return function()
	local component = {
		format = nil,
		update = nil,

		separator = nil,
		icon = nil,
		section = nil,
		content = nil,

		highlight = {
			content = nil,
			icon = nil,
			default = nil,
			separator = nil,
		},
	}

	function component:update_hl()
		local map = { a = "a", b = "b", c = "c", x = "c", y = "b", z = "a" }
		local mode = vim.api.nvim_get_mode().mode

		if mode == "n" then
			self.highlight.content = "NSNormalSection" .. map[self.section]:upper()
			self.highlight.separator = "NSNormalSeparator" .. map[self.section]:upper()
		end

		if mode == "i" then
			self.highlight.content = "NSInsertSection" .. map[self.section]:upper()
			self.highlight.separator = "NSInsertSeparator" .. map[self.section]:upper()
		end

		if mode == "v" then
			self.highlight.content = "NSVisualSection" .. map[self.section]:upper()
			self.highlight.separator = "NSVisualSeparator" .. map[self.section]:upper()
		end

		if mode == "R" then
			self.highlight.content = "NSReplaceSection" .. map[self.section]:upper()
			self.highlight.separator = "NSReplaceSeparator" .. map[self.section]:upper()
		end

		if mode == "c" then
			self.highlight.content = "NSCommandSection" .. map[self.section]:upper()
			self.highlight.separator = "NSCommandSeparator" .. map[self.section]:upper()
		end

		if mode == "t" then
			self.highlight.content = "NSTerminalSection" .. map[self.section]:upper()
			self.highlight.separator = "NSTerminalSeparator" .. map[self.section]:upper()
		end
	end

	function component:apply_hl(content)
		local result = ""

		if self.icon ~= nil then
			result = result .. "%#" .. self.highlight.icon .. "# " .. self.icon
		end

		if self.section < "x" then
			result = result
				.. "%#"
				.. self.highlight.content
				.. "# "
				.. content
				.. " %#"
				.. self.highlight.default
				.. "#"

			if self.separator ~= nil then
				result = result
					.. "%#"
					.. self.highlight.separator
					.. "#"
					.. self.separator
					.. "%#"
					.. self.highlight.default
					.. "#"
			end
		else
			if self.separator ~= nil then
				result = result
					.. "%#"
					.. self.highlight.separator
					.. "#"
					.. self.separator
					.. "%#"
					.. self.highlight.default
					.. "#"
			end
			result = result
				.. "%#"
				.. self.highlight.content
				.. "# "
				.. content
				.. " %#"
				.. self.highlight.default
				.. "#"
		end

		return result
	end

	function component:get_formated()
		local is_function = type(self.content) == "function"

		if is_function and self.content() == nil or self.content == nil then
			return "%#" .. self.highlight.default .. "#"
		end

		if self.format then
			return component:apply_hl(self.format(is_function and self.content() or self.content))
		end

		return component:apply_hl(is_function and self.content() or self.content)
	end

	return component
end
