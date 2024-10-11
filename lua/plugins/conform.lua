return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },

			tex = { lsp_format = "prefer" },

			python = { "ruff_format" },

			rust = { "rustfmt" },
			--
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },

			nix = { "nixfmt" },
		},

		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
		},
	},
}
