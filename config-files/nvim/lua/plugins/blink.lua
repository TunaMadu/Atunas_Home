local util = require("core.util")
local blink = require("blink.cmp")

blink.setup()

util.get_language_lsps(function(lsps)
	for _, lsp in ipairs(lsps) do
		vim.lsp.config(lsp, {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})

		vim.lsp.enable(lsp)
	end
end)

--so far we are only having lsp configurations for
--lua
--ruby
