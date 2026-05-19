local M = {}

-- :lua= vim.bo.filetype
--
-- The filetype determines the language used.
-- filetypes =kinda_equals= language
local filetype_info = {
	lua = {
		lsp = "lua_ls",
		formatters = { "stylua" },
	},

	-- ruby is a weird one
	-- the only thing i was able to find surrounding ruby-lsp vs solargraph was:
	-- one is newer, ruby-lsp requires a gemfile whereas solargraph
	-- can use globally installed gems.
	-- Solargraph is the more automatic since it requires less setup. but the errors
	-- aren't as nice IMO either way, both use rubocop under the hood for
	-- formatting and linting within the lsp itself... p freaking cool
	ruby = {
		lsp = "ruby_lsp",
		formatters = { lsp_format = "prefer" },
		-- linters = { "" }, -- we don't even need this line here since it will try linting with rubocop if given a config
	},
}

local comb_list = function(callback)
	local temp = {}
	for ftype, info in pairs(filetype_info) do
		callback(ftype, info, temp)
	end
	return temp
end

M.filter = function(filter)
	return comb_list(filter)
end

M.get_language_formatters = function()
	return comb_list(function(ftype, info, temp)
		temp[ftype] = info.formatters
	end)
end

M.get_language_linters = function()
	return comb_list(function(ftype, info, temp)
		if info.linters ~= nil then
			temp[ftype] = info.linters
		end
	end)
end

M.get_languages = function()
	return comb_list(function(ftype, _, temp)
		table.insert(temp, ftype)
	end)
end

M.get_language_lsps = function(aux)
	aux(comb_list(function(_, info, temp)
		table.insert(temp, info.lsp)
	end))
end

M.fetch_plugins = function(sources)
	local gh = "https://github.com/"

	local plugins = {}

	for _, src in pairs(sources) do
		if type(src) == "string" then
			table.insert(plugins, gh .. src)
		else
			table.insert(plugins, { src = gh .. src[1], version = src[2] })
		end
	end

	vim.pack.add(plugins)
end

M.load_plugins = function()
	local files = vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/plugins")

	for i = 1, #files do
		local plugin_name = vim.split(files[i], "%.")[1]
		require("plugins." .. plugin_name)
	end
end

return M
