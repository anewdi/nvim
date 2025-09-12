vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
})

local ft = {
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
	"latex",
	"typescript",
	"vim",
	"xml",
	"yaml",
	"zig",
	"nix",
}

require("nvim-treesitter").install(ft)

require("nvim-treesitter").setup({})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(as)
		if as.data.spec.name == "nvim-treesitter" then
			require("nvim-treesitter").update()
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = ft,
	callback = function()
		vim.treesitter.start()
	end,
})
