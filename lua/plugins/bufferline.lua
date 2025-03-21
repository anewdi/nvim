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
				max_name_length = 22,
				style_preset = bufferline.style_preset.no_bold,
			},
		})
	end,
}
--local lualine = {
--	"nvim-lualine/lualine.nvim",
--	dependencies = { "nvim-tree/nvim-web-devicons" },
--	opts = {
--		options = {
--			icons_enabled = true,
--			theme = "auto",
--			component_separators = { left = "|", right = "" },
--			section_separators = "",
--			disabled_filetypes = {
--				statusline = {},
--				winbar = {},
--			},
--			ignore_focus = {},
--			always_divide_middle = true,
--			globalstatus = true,
--			refresh = {
--				statusline = 100,
--				tabline = 1000,
--				winbar = 1000,
--			},
--		},
--		sections = {
--			lualine_a = {},
--			lualine_b = {},
--			lualine_c = { "%F", "diagnostics" },
--			lualine_x = { "encoding", "location", "progress" },
--			lualine_y = {},
--			lualine_z = {},
--		},
--		inactive_sections = {},
--
--		--tabline = {
--		--	lualine_a = { { "buffers", mode = 2 } },
--		--	lualine_b = {},
--		--	lualine_c = {},
--		--	lualine_x = {},
--		--	lualine_y = {},
--		--	lualine_z = {},
--		--},
--		extensions = {},
--	},
--}
--return lualine
