local theme = "mellow"

if theme == "everforest" then
	vim.pack.add({
		"https://github.com/sainnhe/everforest",
	})
	vim.g.everforest_enable_italic = 0
	vim.g.everforest_disable_italic_comment = 1
	vim.g.everforest_background = "medium"
	vim.cmd.colorscheme("everforest")
elseif theme == "mellow" then
	vim.pack.add({
		"https://github.com/mellow-theme/mellow.nvim",
	})
	vim.g.mellow_transparent = true
	vim.cmd.colorscheme("mellow")
elseif theme == "mellifluous" then
	vim.pack.add({
		"https://github.com/ramojus/mellifluous.nvim",
	})
	vim.cmd.colorscheme("mellifluous")
elseif theme == "github" then
	vim.pack.add({
		"https://github.com/projekt0n/github-nvim-theme",
	})
	vim.cmd.colorscheme("github_dark")
end
