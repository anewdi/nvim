return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.tex_flavor = "latex"
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_quickfix_mode = 0
		vim.opt.conceallevel = 0
		vim.g.vimtex_syntax_conceal_disable = 1
		vim.g.vimtex_syntax_conceal = {
			accents = 0,
			ligatures = 0,
			cites = 0,
			fancy = 0,
			spacing = 0,
			greek = 0,
			math_bounds = 1,
			math_delimiters = 0,
			math_fracs = 0,
			math_super_sub = 0,
			math_symbols = 0,
			sections = 0,
			styles = 0,
		}
	end,
}
