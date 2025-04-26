local function mocha()
	local color = {
		rosewater = "#f5e0dc",
		flamingo = "#f2cdcd",
		pink = "#f5c2e7",
		mauve = "#cba6f7",
		red = "#f38ba8",
		maroon = "#eba0ac",
		peach = "#fab387",
		yellow = "#f9e2af",
		green = "#a6e3a1",
		teal = "#94e2d5",
		sky = "#89dceb",
		sapphire = "#74c7ec",
		blue = "#89b4fa",
		lavender = "#b4befe",
		text = "#cdd6f4",
		subtext1 = "#bac2de",
		subtext0 = "#a6adc8",
		overlay2 = "#9399b2",
		overlay1 = "#7f849c",
		overlay0 = "#6c7086",
		surface2 = "#585b70",
		surface1 = "#45475a",
		surface0 = "#313244",
		base = "#1e1e2e",
		mantle = "#181825",
		crust = "#11111b",
		none = "NONE",
	}
	local theme = {}

	theme.normal = {
		a = { bg = color.blue, fg = color.mantle },
		b = { bg = color.surface0, fg = color.blue },
		c = { bg = color.none, fg = color.none },
	}

	theme.insert = {
		a = { bg = color.green, fg = color.base },
		b = { bg = color.surface0, fg = color.green },
	}

	theme.terminal = {
		a = { bg = color.green, fg = color.base },
		b = { bg = color.surface0, fg = color.green },
	}

	theme.command = {
		a = { bg = color.peach, fg = color.base },
		b = { bg = color.surface0, fg = color.peach },
	}

	theme.visual = {
		a = { bg = color.mauve, fg = color.base },
		b = { bg = color.surface0, fg = color.mauve },
	}

	theme.replace = {
		a = { bg = color.red, fg = color.base },
		b = { bg = color.surface0, fg = color.red },
	}

	theme.inactive = {
		a = { bg = color.mantle, fg = color.blue },
		b = { bg = color.mantle, fg = color.surface1 },
		c = { bg = color.none, fg = color.none },
	}

	return theme
end

local theme = mocha()

vim.api.nvim_set_hl(0, "NSNormalSectionA", { fg = theme.normal.a.fg, bg = theme.normal.a.bg })
vim.api.nvim_set_hl(0, "NSNormalSectionB", { fg = theme.normal.b.fg, bg = theme.normal.b.bg })
vim.api.nvim_set_hl(0, "NSNormalSectionC", { fg = theme.normal.c.fg, bg = theme.normal.c.bg })

vim.api.nvim_set_hl(0, "StatusLineA", { fg = theme.normal.a.fg, bg = theme.normal.a.bg })
vim.api.nvim_set_hl(0, "StatusLineB", { fg = theme.normal.b.fg, bg = theme.normal.b.bg })
vim.api.nvim_set_hl(0, "StatusLineC", { fg = theme.normal.c.fg, bg = theme.normal.c.bg })

vim.api.nvim_set_hl(0, "StatusLineSeparatorA", { fg = theme.normal.a.bg, bg = theme.normal.b.bg })
vim.api.nvim_set_hl(0, "StatusLineSeparatorB", { fg = theme.normal.b.bg, bg = theme.normal.c.bg })
vim.api.nvim_set_hl(0, "StatusLineSeparatorC", { fg = theme.normal.c.bg, bg = theme.normal.c.bg })
