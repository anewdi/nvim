return {
	"saghen/blink.cmp",
	version = "1.4.1",
	--dependencies = "rafamadriz/friendly-snippets",

	opts = {
		keymap = {
			preset = "enter",

			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
			use_nvim_cmp_as_default = true,
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust" },

		completion = {
			accept = { auto_brackets = { enabled = false } },
			documentation = { window = { border = "single" } },
			menu = {
				-- nvim-cmp style menu
				draw = {
					columns = {
						{ "label", "kind", gap = 1 },
						{ "label_description" },
					},
				},
			},
		},

		signature = { enabled = false, window = { border = "single" } },
	},
}
