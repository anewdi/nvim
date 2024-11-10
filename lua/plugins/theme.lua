local colors = {
	everforest = {
		"sainnhe/everforest",
		name = "everforest",
		priority = 1000,
		init = function()
			vim.g.everforest_enable_italic = 0
			vim.g.everforest_disable_italic_comment = 1
			vim.g.everforest_background = "medium"
			vim.cmd.colorscheme("everforest")
		end,
	},
	mellow = {
		"mellow-theme/mellow.nvim",
		name = "mellow",
		priority = 1000,
		init = function()
			vim.g.mellow_transparent = true
			vim.cmd.colorscheme("mellow")
		end,
	},
	mellifluous = {
		"ramojus/mellifluous.nvim",
		name = "mellifluous",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("mellifluous")
		end,
	},
	github = {

		"projekt0n/github-nvim-theme",
		name = "github-theme",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("github_dark")
		end,
	},
}
return colors["mellow"]
