local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

function load_env(devEnv)
	-- load selected environment plugins
	envName = devEnv .. "Plugins"
	print(envName)
	require("lazy").setup(envName)
end

require("remap")

require("lazy").setup("plugins")

-- LSP config:
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { "pyright",  "java_language_server",  "tsserver" },
		handlers = {
			function(server_name)
				require('lspconfig')[server_name].setup({})
			end,
		},
	})

--  SETUP & LOAD THEME
-- Setup
require("tokyonight").setup({
  -- use the night style
  style = "storm",
  transparent = true,
  -- disable italic for functions
  styles = {
    functions = {}
  },
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
  end
})
-- Setup
vim.cmd[[colorscheme tokyonight-storm]]
