vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = "v1.6.0",
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
})
