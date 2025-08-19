vim.pack.add({
	"https://github.com/folke/trouble.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

require("trouble").setup({
	focus = true,
	open_no_results = true,
	warn_no_results = false,
	auto_preview = false,
	icons = {
		indent = {
			middle = " ",
			last = " ",
			top = " ",
			ws = "│  ",
		},
	},
})

vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
