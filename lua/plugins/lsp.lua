if vim.fn.exepath("nix") ~= "" then
	LspDeps = {
		--Completion
		"saghen/blink.cmp",
	}
else
	LspDeps = {
		--Completion
		"saghen/blink.cmp",

		--Lsp servers from neovim management
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}
end

return {
	"neovim/nvim-lspconfig",
	dependencies = LspDeps,

	config = function()
		-- Format: Mason name = {binaryName, config}
		local servers = {
			clangd = { bin = "clangd", conf = {} },
			lua_ls = {
				bin = "lua-language-server",
				conf = {
					settings = {
						Lua = {
							diagnostics = {
								globals = {
									"vim",
								},
							},
						},
					},
				},
			},
			html = { bin = "vscode-html-language-server", conf = {} },
			cssls = { bin = "vscode-css-language-server", conf = {} },
			jsonls = { bin = "vscode-json-language-server", conf = {} },
			eslint = { bin = "vscode-eslint-language-server", conf = {} },
			ts_ls = { bin = "typescript-language-server", conf = {} },
			ruff = { bin = "ruff", conf = {} },
			texlab = { bin = "texlab", conf = {} },
			glslls = { bin = "glslls", conf = {} },
			jdtls = {
				bin = "jdtls",
				conf = {
					init_options = {
						bundles = { os.getenv("javadebugpath") },
					},
				},
			},
		}

		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local lspconfig = require("lspconfig")

		local on_init = function(client, bufnr)
			client.server_capabilities.semantictokensprovider = nil
		end

		if vim.fn.exepath("nix") ~= "" then
			servers.nixd = { bin = "nixd", conf = {} }
			for server, set in pairs(servers) do
				set.conf.capabilities = capabilities
				set.conf.on_init = on_init
				lspconfig[server].setup(set.conf)
			end
		else
			require("mason").setup({})
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						servers[server_name].conf.capabilities = capabilities
						servers[server_name].conf.on_init = on_init
						lspconfig[server_name].setup({ servers[server_name].conf })
					end,
				},
				ensure_installed = vim.tbl_keys(servers),
			})
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
	end,
}
