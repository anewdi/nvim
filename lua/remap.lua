----Moving between windows and buffers-----------------------------------------

vim.keymap.set("n", "<leader>n", vim.cmd.bprevious)
vim.keymap.set("n", "<leader>m", vim.cmd.bnext)

vim.keymap.set("n", "<leader>l", function()
	vim.cmd.winc("l")
end)

vim.keymap.set("n", "<leader>h", function()
	vim.cmd.winc("h")
end)

vim.keymap.set("n", "<leader>j", function()
	vim.cmd.winc("j")
end)

vim.keymap.set("n", "<leader>k", function()
	vim.cmd.winc("k")
end)

vim.keymap.set("n", "<leader>.", function()
	vim.cmd("vert res +8")
end)

vim.keymap.set("n", "<leader>,", function()
	vim.cmd("vert res -8")
end)

vim.keymap.set("n", "<leader>i", function()
	vim.cmd("res -3")
end)

vim.keymap.set("n", "<leader>o", function()
	vim.cmd("res +3")
end)

vim.keymap.set("n", "<leader>=", function()
	vim.cmd("horizontal wincmd =")
end)
----Manipulating windows ------------------------------------------------------

vim.keymap.set("n", "<leader>qq", function()
	vim.cmd.vsplit()
	vim.cmd.winc("l")
	vim.cmd.Ex()
end)

vim.keymap.set("n", "<leader>qh", function()
	vim.cmd.wincmd("H")
end)
vim.keymap.set("n", "<leader>qj", function()
	vim.cmd.wincmd("J")
end)
vim.keymap.set("n", "<leader>qk", function()
	vim.cmd.wincmd("K")
end)
vim.keymap.set("n", "<leader>ql", function()
	vim.cmd.wincmd("L")
end)
vim.keymap.set("n", "<leader>qd", function()
	vim.cmd("close")
end)

----Perform mischalennious vim commands through remaps-------------------------

--Delete buffer
vim.keymap.set("n", "<leader>d", vim.cmd.bd)
--Reach(explore)
vim.keymap.set("n", "<leader>r", vim.cmd.Ex)

--Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')

--Move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--automatic centering on next search match
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")
