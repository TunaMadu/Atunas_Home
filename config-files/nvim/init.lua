vim.g.mapleader = " "
vim.g.localleader = " "

vim.api.nvim_create_autocmd("PackChanged",{
	callback = function(ev)
	  local name, kind = ev.data.spec.name,ev.data.kind

		if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
			-- make is pretty cool... you don't have to worry about... (don't quote me)
			-- not building when there is already a built version of the program.
			-- Make will allow for rebuilding if any source files are more recent than the 
			-- built application. So we don't have to worry about removing the built application
			-- and then running make... Make is smart enough
			-- You can test this by installing an older version of a plugin and then updating it, 
			-- and check the timestamp of the built program @ 
			-- $HOME/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim/build
			-- 
			-- This may or may not show my inexperience with c and its build systems... 
			-- And to the whole world of building from source... Build? just lemme run it 
			vim.system({"make"}, { cwd = ev.data.path })
		end
	end
})

-- because pack can't really resolve dependencies (yet) like lazy
-- we should really install em separately first but things function for now
local fetch = function(x) return "https://github.com/" .. x end
vim.pack.add({
	fetch "rebelot/kanagawa.nvim",

	fetch "nvim-telescope/telescope.nvim",
	fetch 'nvim-lua/plenary.nvim',
	fetch 'nvim-telescope/telescope-fzf-native.nvim',

	fetch 'neovim/nvim-lspconfig' , -- fetches lsp config files so that we don't have to manually bring them into the editor to enable
})


vim.cmd.colorscheme "kanagawa"

require"core-configs.keybinds"
require"core-configs.options"

--
-- LSP setup... 
-- We used mason in the past for our dev tooling.
-- But I want to try using mise for this core, system level tooling, letting
-- nvim focus more on the editor itself. This does mean our mise config file 
-- will need more things to fetch and does create a dependence on the tool 
-- for anything to function... but i think it makes things more robust.
--

vim.lsp.enable("lua_ls")

--
-- :h diagnostic
--
vim.diagnostic.config({
	-- p cool error integration
	-- though the effect is a little jarring with many errors lol
	virtual_lines = {
		severity = {
			vim.diagnostic.severity.ERROR,
			vim.diagnostic.severity.WARN,
		},
	},
	virtual_text = {
		severity = {
			vim.diagnostic.severity.INFO,
			vim.diagnostic.severity.HINT,
		},
	},
})
