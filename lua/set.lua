vim.g.mapleader = " "

--Let insert cursor be the same as normal one 
vim.opt.guicursor = ""

--Numbered & relative linenumbers
vim.opt.nu = true
vim.opt.relativenumber = true

--4 space indents and smartindent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

--Persistent undohistory
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--Don't highlight every match, but highlight one match for refrence
vim.opt.hlsearch = true
vim.opt.incsearch = true

--Terminal colors 
vim.opt.termguicolors = true

--Always keep 8 lines to bottom 
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.cursorline = true
