return {
	"nvim-treesitter/nvim-treesitter",
	cmd = "TSUpdate",
	opts = {
		ensure_installed = { "lua", "python", "java", "javascript", "typescript" },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
		},
		additional_vim_regex_highlighting = false
	}
}
