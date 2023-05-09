local config = {
	ui = {
		default = "float",
		float = {
			border = { " ", " ", " ", " ", " ", " ", " ", " " },
			float_hl = "Normal",
			border_hl = "FloatBorder",
			blend = 0,
			height = 1,
			width = 1,
			x = 0.5,
			y = 0.5,
		},
		split = "rightbelow new", -- `leftabove new`, `rightbelow new`, `leftabove vnew 24`, `rightbelow vnew 24`
	},
	on_close = {},
	on_open = {},
	mappings = {
		split = "<C-x>",
		vsplit = "<C-v>",
		tabedit = "<C-t>",
		edit = "<C-e>",
		close = "<C-q>",
	},
	env = {
		LVIM_FORGIT_PATH = vim.fn.fnamemodify(debug.getinfo(1, "S").source:gsub("^@", ""), ":h:h"),
	},
}

local M = {}

M.init = function()
	local lvim_shell = require("lvim-shell")
	local exe_file = vim.fn.fnamemodify(debug.getinfo(1, "S").source:gsub("^@", ""), ":h:h") .. "/bin/LvimForgit"
	if config.ui.default == "split" then
		lvim_shell.split(exe_file, "<CR>", config)
	else
		lvim_shell.float(exe_file, "<CR>", config)
	end
end

M.commands = function()
	vim.api.nvim_create_user_command("LvimForgit", function()
		M.init()
	end, {})
end

M.setup = function(user_config)
	if user_config ~= nil then
		config = vim.tbl_deep_extend("force", config, user_config)
	end
	M.commands()
end

return M