return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				always_show_bufferline = true,
				separator_style = "thin",
				style_preset = bufferline.style_preset.no_bold,
			},
		})
	end,
}
