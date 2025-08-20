vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
})

require("nvim-treesitter").install({
	"bash",
	"c",
	"dockerfile",
	"fish",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"go",
	"gomod",
	"gosum",
	"html",
	"javascript",
	"json",
	"java",
	"javafx",
	"lua",
	"make",
	"markdown",
	"python",
	"rust",
	"sql",
	"toml",
	"tsx",
	"typescript",
	"latex",
	"vim",
	"yaml",
	"zig",
	"nix",
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(as)
		if as.data.spec.name == "nvim-treesitter" then
			require("nvim-treesitter").update()
		end
	end,
})
