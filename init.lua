vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

--Persistent undohistory
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.g.undotree_DiffAutoOpen = 0
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

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

----Perform mischalennious vim commands through remaps-------------------------

--delete buffer
vim.keymap.set("n", "<leader>d", vim.cmd.bd)
--explore
vim.keymap.set("n", "<leader>r", vim.cmd.Ex)

--copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')

--Move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--automatic centering on next search match
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")

--some plugins
vim.keymap.set("n", "<leader>c", vim.cmd.ColorizerToggle)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

----Plugins--------------------------------------------------------------------

vim.opt.packpath:prepend(vim.fn.expand("~/.local/share/nvim/site/"))

vim.pack.add({
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/mbbill/undotree",
	"https://github.com/norcalli/nvim-colorizer.lua",
}, { confirm = false })

require("ibl").setup()
require("nvim-ts-autotag").setup()

require("vimtex")
require("diagnostics")
require("bline")
require("autopairs")
require("formatter")
require("theme")
require("finder")
require("autocomplete")
require("lsp")
require("ts")
