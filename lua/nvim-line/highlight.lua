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

	return theme
end

local theme = mocha()

vim.api.nvim_set_hl(0, "NSNormalSectionA", { fg = theme.normal.a.fg, bg = theme.normal.a.bg })
vim.api.nvim_set_hl(0, "NSNormalSectionB", { fg = theme.normal.b.fg, bg = theme.normal.b.bg })

vim.api.nvim_set_hl(0, "NSInsertSectionA", { fg = theme.insert.a.fg, bg = theme.insert.a.bg })
vim.api.nvim_set_hl(0, "NSInsertSectionB", { fg = theme.insert.b.fg, bg = theme.insert.b.bg })

vim.api.nvim_set_hl(0, "NSVisualSectionA", { fg = theme.visual.a.fg, bg = theme.visual.a.bg })
vim.api.nvim_set_hl(0, "NSVisualSectionB", { fg = theme.visual.b.fg, bg = theme.visual.b.bg })

vim.api.nvim_set_hl(0, "NSReplaceSectionA", { fg = theme.replace.a.fg, bg = theme.replace.a.bg })
vim.api.nvim_set_hl(0, "NSReplaceSectionB", { fg = theme.replace.b.fg, bg = theme.replace.b.bg })

vim.api.nvim_set_hl(0, "NSCommandSectionA", { fg = theme.command.a.fg, bg = theme.command.a.bg })
vim.api.nvim_set_hl(0, "NSCommandSectionB", { fg = theme.command.b.fg, bg = theme.command.b.bg })

vim.api.nvim_set_hl(0, "NSTerminalSectionA", { fg = theme.terminal.a.fg, bg = theme.terminal.a.bg })
vim.api.nvim_set_hl(0, "NSTerminalSectionB", { fg = theme.terminal.b.fg, bg = theme.terminal.b.bg })

vim.api.nvim_set_hl(0, "NSNormalStatus", { fg = "NONE", bg = "NONE" })

vim.api.nvim_set_hl(0, "NSNormalSeparatorA", { fg = theme.normal.a.bg, bg = theme.normal.b.bg })
vim.api.nvim_set_hl(0, "NSNormalSeparatorB", { fg = theme.normal.b.bg, bg = theme.normal.c.bg })

vim.api.nvim_set_hl(0, "NSInsertSeparatorA", { fg = theme.insert.a.bg, bg = theme.insert.a.fg })
vim.api.nvim_set_hl(0, "NSInsertSeparatorB", { fg = theme.insert.b.bg, bg = theme.normal.c.bg })

vim.api.nvim_set_hl(0, "NSVisualSeparatorA", { fg = theme.visual.a.bg, bg = theme.visual.a.fg })
vim.api.nvim_set_hl(0, "NSVisualSeparatorB", { fg = theme.visual.b.bg, bg = theme.normal.c.bg })

vim.api.nvim_set_hl(0, "NSReplaceSeparatorA", { fg = theme.replace.a.bg, bg = theme.replace.a.fg })
vim.api.nvim_set_hl(0, "NSReplaceSeparatorB", { fg = theme.replace.b.bg, bg = theme.normal.c.bg })

vim.api.nvim_set_hl(0, "NSCommandSeparatorA", { fg = theme.command.a.bg, bg = theme.command.a.fg })
vim.api.nvim_set_hl(0, "NSCommandSeparatorB", { fg = theme.command.b.bg, bg = theme.normal.c.bg })

vim.api.nvim_set_hl(0, "NSTerminalSeparatorA", { fg = theme.terminal.a.bg, bg = theme.terminal.a.fg })
vim.api.nvim_set_hl(0, "NSTerminalSeparatorB", { fg = theme.terminal.b.bg, bg = theme.normal.c.bg })
