vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
})

local ft = {
	"bash",
	"c",
	"cpp",
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
	"tex",
	"nix",
}

require("nvim-treesitter").install(ft)

vim.treesitter.language.register("latex", { "tex" })

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
