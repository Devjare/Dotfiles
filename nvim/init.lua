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

require("configs.lsp-zero")
require("configs.nvim-dap")

--  SETUP & LOAD tokyonight THEME
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
-- require("tokyonight").setup({})
-- Setup
vim.cmd[[colorscheme tokyonight]]
vim.cmd[[colorscheme shado]]

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


local set = vim.opt -- set options
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

set.relativenumber = true
