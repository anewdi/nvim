vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },

		tex = { lsp_format = "prefer" },

		python = { "ruff_format" },

		rust = { "rustfmt" },

		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },

		nix = { "nixfmt" },

		cpp = { lsp_format = "prefer" },
	},

	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
})

vim.keymap.set("n", "<leader>p", function()
	require("conform").format()
end)
