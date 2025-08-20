vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
})

local servers = {
	["clangd"] = {},
	["lua-language-server"] = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	["vscode-html-language-server"] = {},
	["vscode-css-language-server"] = {},
	["vscode-json-language-server"] = {},
	["vscode-eslint-language-server"] = {},
	["typescript-language-server"] = {},
	["ruff"] = {},
	["texlab"] = {},
	["glslls"] = {},
	["jdtls"] = { init_options = { bundles = { os.getenv("javadebugpath") } } },
	["nixd"] = {},
}

if vim.fn.exepath("nix") == "" then
	vim.pack.add({
		"https://github.com/williamboman/mason.nvim",
		"https://github.com/williamboman/mason-lspconfig.nvim",
	})
	require("mason").setup({})
	require("mason-lspconfig").setup({
		ensure_installed = {
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
		},
	})
end

for server, conf in pairs(servers) do
	vim.lsp.enable(server)
	vim.lsp.config(server, conf)
end

-- Diagnostic setup
vim.diagnostic.config({
	virtual_text = false,
})

-- Remove signs and only highlight number and text
local signs = { "Error", "Warn", "Hint", "Info" }
for ind, value in pairs(signs) do
	local hl = "DiagnosticSign" .. value
	vim.fn.sign_define(hl, { text = "", linehl = "", texthl = "", numhl = hl })
end
