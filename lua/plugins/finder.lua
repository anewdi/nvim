return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files({ cwd = vim.fn.expand("%:p:h:h") })
			end,
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").live_grep({ cwd = vim.fn.expand("%:p:h:h") })
			end,
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").git_files()
			end,
		},
		{
			"<leader>b",
			function()
				require("fzf-lua").buffers()
			end,
		},
	},
}
