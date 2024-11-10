return {
	{
		"norcalli/nvim-colorizer.lua",
	}, --Undotree
	{
		"mbbill/undotree",
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
