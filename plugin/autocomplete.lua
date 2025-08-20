vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("<2.0.0"),
		--dependencies = "rafamadriz/friendly-snippets",
	},
})

require("blink.cmp").setup({
	keymap = {
		preset = "enter",
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
	},

	appearance = {
		use_nvim_cmp_as_default = true,
	},

	completion = {
		accept = { auto_brackets = { enabled = false } },
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
			window = {
				border = "single",
			},
		},
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

	signature = { enabled = true, window = { border = "single" } },
})
