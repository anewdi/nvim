return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			auto_install = true,
			ensure_installed = { "c", "lua", "vim", "python" },
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "latex" },
			},
			indent = { enable = false },
		})
	end,
}
