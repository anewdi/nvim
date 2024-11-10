if vim.fn.exepath("nix") ~= "" then
	LspDeps = {
		"neovim/nvim-lspconfig",
		--LSP support
		--Autocomp
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		--'L3MON4D3/LuaSnip',
	}
else
	LspDeps = {
		"neovim/nvim-lspconfig",
		--LSP support
		--Autocomp
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		--'L3MON4D3/LuaSnip',
		--Lsp servers from neovim management
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}
end

return {
	--Lsp Zero
	"VonHeikemen/lsp-zero.nvim",
	dependencies = LspDeps,

	config = function()
		local lsp_zero = require("lsp-zero")

		-- Apply default keybinds
		-- Remove lsp highlighting
		local lsp_attach = function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
			client.server_capabilities.semanticTokensProvider = nil
		end

		lsp_zero.extend_lspconfig({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			lsp_attach = lsp_attach,
			float_border = "rounded",
			sign_text = true,
		})

		-- LSPs
		local lspconfig = require("lspconfig")

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
		}

		if vim.fn.exepath("nix") ~= "" then
			servers.nixd = { bin = "nixd", conf = {} }
			--NIX solution(add in nix shell or syspkgs)
			for server, set in pairs(servers) do
				if vim.fn.exepath(set.bin) ~= "" then
					lspconfig[server].setup(set.conf)
				end
			end
		else
			--Standard
			require("mason").setup({})
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({ servers[server_name].conf })
					end,
				},
				ensure_installed = vim.tbl_keys(servers),
			})
		end

		--Completion setup
		local cmp = require("cmp")
		local cmp_action = require("lsp-zero").cmp_action()

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp_action.tab_complete(),
				["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
			}),
		})

		-- Diagnostic setup
		vim.diagnostic.config({
			virtual_text = false,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		-- Remove signs and only highlight number and text
		local signs = { Error = "X", Warn = "X", Hint = "!", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			-- Modify existing signs, just remove everything except numhl
			vim.fn.sign_define(hl, { text = "", linehl = "", texthl = "", numhl = hl })
		end
	end,
}
