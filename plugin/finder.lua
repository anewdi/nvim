vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
})

local finder = require("fzf-lua")
vim.keymap.set("n", "<leader>ff", function()
	finder.files() --{ cwd = vim.fn.expand("%:p:h:h") })
end)
vim.keymap.set("n", "<leader>/", function()
	finder.live_grep()
end)
vim.keymap.set("n", "<leader>fg", function()
	require("fzf-lua").git_files()
end)
vim.keymap.set("n", "<leader>fb", function()
	require("fzf-lua").buffers()
end)
