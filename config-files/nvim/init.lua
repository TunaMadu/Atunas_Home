vim.g.mapleader = " "
vim.g.localleader = " "


vim.api.nvim_create_autocmd("PackChanged",{
	callback = function(ev)
	  local name, kind = ev.data.spec.name,ev.data.kind

		if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
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
			vim.system({"make"}, { cwd = ev.data.path })
		end
	end
})

-- crazy how much you can simplify when going the native 

local fetch = function(x) return "https://github.com/" .. x end
vim.pack.add({
	fetch "rebelot/kanagawa.nvim",

	fetch "nvim-telescope/telescope.nvim",
	fetch 'nvim-lua/plenary.nvim',
	fetch 'nvim-telescope/telescope-fzf-native.nvim',

	fetch 'neovim/nvim-lspconfig' , -- fetches lsp config files so that we don't have to manually bring them into the editor to enable
                                  -- any configuration that we do add within /lsp will be overrides or specific extensions to the lsp itself
})


vim.cmd.colorscheme "kanagawa"

require"core-configs.keybinds"
require"core-configs.options"

--
-- LSP setup... 
-- We used mason in the past for our dev tooling.
-- But I want to try using mise for this core, system level tooling, letting
-- nvim focus more on the editor itself. This means that we will depend on 
-- mise a lot more... but it makes things more robust. As all the setup
-- is bundled together making it easier to bash it.
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
