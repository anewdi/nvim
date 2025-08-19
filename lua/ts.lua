vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	auto_install = true,
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function()
		require("nvim-treesitter").update()
	end,
})
