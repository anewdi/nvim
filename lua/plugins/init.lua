return {
	{ "MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		ft = { "md" },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
        opts = {},
	},
	{
		"norcalli/nvim-colorizer.lua",
		keys = {
			{ "<leader>c", vim.cmd.ColorizerToggle },
		},
        opts = {},
	},
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle },
		},
	},
	{
		"windwp/nvim-ts-autotag",
		ft = { "ts", "html", "css", "js" },
        opts = {},
	},
}
