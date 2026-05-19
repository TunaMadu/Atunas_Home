vim.api.nvim_create_autocmd({ "PackChanged" }, {
	callback = function(ev)
		local name, change_type = ev.data.spec.name, ev.data.kind

		if name == "telescope-fzf-native.nvim" and (change_type == "install" or change_type == "update") then
			--
			-- make is pretty cool... you don't have to worry about... (don't quote me)
			-- not building when there is already a built version of the program.
			-- Make will allow for rebuilding if any source files are more recent than the
			-- built application. So we don't have to worry about removing the built application
			-- and then running make again... Because make is smart enough...
			-- You can test this by installing an older version of a plugin and then updating it,
			-- and check the timestamp of the built program @
			-- $HOME/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim/build
			--
			-- This may or may not show my inexperience with c and its build systems...
			-- And to the whole world of building from source...
			--
			vim.system({ "make" }, { cwd = ev.data.path })
		end
		if name == "nvim-treesitter" and (change_type == "install" or change_type == "update") then
			vim.cmd("TSUpdate")
		end
	end,
})

-- local lint = require("lint")
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	callback = function()
-- 		lint.try_lint()
-- 	end,
-- })
