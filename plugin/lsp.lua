vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
})
local configs = {
	["lua_ls"] = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	["jdtls"] = { init_options = { bundles = { os.getenv("javadebugpath") } } },
}

local servers = {
	"clangd",
	"lua_ls",
	"html",
	"cssls",
	"jsonls",
	"eslint",
	"ts_ls",
	"ruff",
	"texlab",
	"glslls",
	"jdtls",
	"nixd",
}

if vim.fn.exepath("nix") == "" then
	vim.pack.add({
		"https://github.com/williamboman/mason.nvim",
		"https://github.com/williamboman/mason-lspconfig.nvim",
	})
	require("mason").setup({})
	require("mason-lspconfig").setup({ ensure_installed = servers })
end

vim.lsp.enable(servers)

for server, conf in pairs(configs) do
	vim.lsp.config(server, conf)
end

-- Diagnostic setup
vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
		numhl = {
			[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticHint",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		},
	},
	severity_sort = true,
})

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function()
		vim.diagnostic.setqflist({ open = false })
	end,
})

vim.keymap.set("n", "<leader>t", function()
	if vim.fn.getqflist({ winid = 0 }).winid ~= 0 then
		vim.cmd("cclose")
	else
		vim.cmd("cope")
	end
end)
