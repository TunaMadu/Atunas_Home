local options = {
	-- QOL
	wrap = false,
	-- scrolloff = 5
	sidescrolloff = 80,

	--- even though we dont even use numbers while we jump
	--- we still like them on the side...
	number = true,
	relativenumber = true,

	-- TABS AND INDENTATIONS
	tabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	smarttab = true,
	smartindent = true,
	autoindent = true, -- copies indent of current line to new one

	-- SEARCH
	ignorecase = true, -- not only removes casing while searching but also allows you to tab complete commands without caring for casing!

	smartcase = true, -- if you include a mixed cased while searching, will assume you want case sens

	-- SWAG
	undofile = true, -- not sure if this is a potential sec risk lol - more research needed
	termguicolors = true,
	cursorline = true,
	updatetime = 250, -- in ms, after set time writes to swap!
	signcolumn = "yes", -- adds a white space for any special character we might have to the side of our numbers
	splitbelow = true,
	splitright = true,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

-- CLIPBOARD
vim.opt.clipboard:append("unnamedplus")
