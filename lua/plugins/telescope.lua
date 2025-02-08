local builtin = require("telescope.builtin")
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	keys = {
		{
			"<leader>/",
			function()
				builtin.live_grep({ cwd = vim.fn.expand("%:p:h:h") })
			end,
		},
		{
			"<leader>ff",
			function()
				builtin.find_files({ cwd = vim.fn.expand("%:p:h:h") })
			end,
		},
		{ "<leader>fg", builtin.git_files },
		{ "<leader>b", builtin.buffers },
	},
	dependencies = { "nvim-lua/plenary.nvim" },
}
