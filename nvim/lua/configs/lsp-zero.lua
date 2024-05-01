-- LSP config:
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
end)


require('mason').setup()
require('mason-lspconfig').setup({
	opts = {
		ensure_installed = { 
			"pyright",
			"mypy",
			"lua-language-server",
			"luaformatter",
		}
	}
})

