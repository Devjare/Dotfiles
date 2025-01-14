-- LSP config:
local lsp_zero = require('lsp-zero').preset({
	manage_nvim_cmp = {
		set_extra_mappings = true,
	}
})

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
			"gopls",
			"emmet-ls",
			"tsserver"
		}
	}
})

require('lspconfig').pyright.setup({{
	python = {
		analysis = {
			autoSearchPaths = true,
			diagnosticMode = "workspace",
			useLibraryCodeForTypes = true,
		},
		venvPath = "/home/devjare/miniconda3/envs"
	}
}})

require('lspconfig').gopls.setup({})
require('lspconfig').lua_ls.setup({})
require('lspconfig').tsserver.setup({})

local capabilities = vim.lsp.protocol.make_client_capabilities()
require('lspconfig').emmet_ls.setup({
	capabilities = capabilities,
	filetypes = { "css", "eruby", "html", "javascript", "javascriptreact",
	"less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
	init_options = {
		html = {
			options = {
				["bem.enabled"] = true,
			},
		},
	}
})
