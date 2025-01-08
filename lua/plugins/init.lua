return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
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
