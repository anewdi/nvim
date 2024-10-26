return {
	{
		"norcalli/nvim-colorizer.lua",
	}, --Undotree
	{
		"mbbill/undotree",
		keys = "<leader>u",
	},
	{
		"windwp/nvim-ts-autotag",
		ft = { "ts", "html", "css", "js" },
		opts = {}, -- this is equalent to setup({}) function
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
}
