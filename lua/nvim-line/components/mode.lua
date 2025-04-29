local M = {}

-- stylua: ignore
M.map = {
  ["n"]      = "NORMAL",
  ["no"]     = "O-PENDING",
  ["nov"]    = "O-PENDING",
  ["noV"]    = "O-PENDING",
  ["no\22"] = "O-PENDING",
  ["niI"]    = "NORMAL",
  ["niR"]    = "NORMAL",
  ["niV"]    = "NORMAL",
  ["nt"]     = "NORMAL",
  ["ntT"]    = "NORMAL",
  ["v"]      = "VISUAL",
  ["vs"]     = "VISUAL",
  ["V"]      = "V-LINE",
  ["Vs"]     = "V-LINE",
  ["\22"]   = "V-BLOCK",
  ["\22s"]  = "V-BLOCK",
  ["s"]      = "SELECT",
  ["S"]      = "S-LINE",
  ["\19"]   = "S-BLOCK",
  ["i"]      = "INSERT",
  ["ic"]     = "INSERT",
  ["ix"]     = "INSERT",
  ["R"]      = "REPLACE",
  ["Rc"]     = "REPLACE",
  ["Rx"]     = "REPLACE",
  ["Rv"]     = "V-REPLACE",
  ["Rvc"]    = "V-REPLACE",
  ["Rvx"]    = "V-REPLACE",
  ["c"]      = "COMMAND",
  ["cv"]     = "EX",
  ["ce"]     = "EX",
  ["r"]      = "REPLACE",
  ["rm"]     = "MORE",
  ["r?"]     = "CONFIRM",
  ["!"]      = "SHELL",
  ["t"]      = "TERMINAL",
}

function M:new(opts)
	local instance = require("nvim-line.component")()

	instance.content = function()
		local mode_code = vim.api.nvim_get_mode().mode

		if M.map[mode_code] == nil then
			return mode_code
		end

		return M.map[mode_code]
	end

	instance.format = function(content)
		return content:sub(1, 1)
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
