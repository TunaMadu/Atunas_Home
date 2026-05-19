-- while this setup is very barebones in terms of the amount
-- languages supported... we don't have to have support
-- every language under the moon if we're not going to use it!
require("core.options")
require("core.keybinds")

local util = require("core.util")

util.fetch_plugins({
	"rebelot/kanagawa.nvim", -- colorscheme

	-- fuzzy navigation
	"nvim-lua/plenary.nvim", -- depend
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-fzf-native.nvim", -- addon

	-- tree sitter not sure when it will stop working...
	"nvim-treesitter/nvim-treesitter",

	---
	--- CORE EDITOR PLUGINS
	---
	-- fetches lsp config files so that we don't have to manually bring
	-- them into the editor to enable em configurations are merged together
	"neovim/nvim-lspconfig",

	-- autocompletions
	{ "saghen/blink.cmp", "v1" },
	-- formatting
	"stevearc/conform.nvim",
	-- linting
	"mfussenegger/nvim-lint",
	-- wait what about mason?!
	-- we're using mise for languages or anything that doesn't have
	-- a package manager. If something has a manager, we opt to use that.
	-- IE: lua-lsp is installed through mise but rubocop is using gem
	--
	-- we could add a debugger... eh
	--

	-- git integration
	"lewis6991/gitsigns.nvim",
})
vim.cmd.colorscheme("kanagawa")

-- loading/using plugins live within
-- ./lua/plugins/
-- we have to run setup on the plugins ourselves
util.load_plugins()

require("core.autocommands")

-- :h diagnostic
vim.diagnostic.config({
	-- p cool error integration
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
	float = {
		source = true,
		border = "bold",
	},
})
