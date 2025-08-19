vim.pack.add({
	"https://github.com/akinsho/bufferline.nvim",
})
require("bufferline").setup({
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp",
		always_show_bufferline = true,
		separator_style = "thin",
		max_name_length = 22,
		style_preset = require("bufferline").style_preset.no_bold,
	},
})
