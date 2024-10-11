return {
	{ "norcalli/nvim-colorizer.lua" }, --Undotree
	{ "mbbill/undotree" },
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
		lazy = false,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "zathura"
			--vim.g.vimtex_general_viewer = "firefox"
			vim.g.tex_flavor = "latex"
			vim.g.vimtex_quickfix_mode = 0
			vim.g.tex_conceal = "abdmg"
			vim.g.conceallevel = 1
		end,
	},
}
