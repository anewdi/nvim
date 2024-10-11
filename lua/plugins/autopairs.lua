return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = function()
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		npairs.setup({})

		npairs.add_rule(Rule("$$", "$$", "tex"))

		npairs.add_rules(
			{
				Rule("$", "$", { "tex", "latex" })
					-- don't add a pair if the next character is %
					:with_pair(cond.not_after_regex("%%"))
					-- don't add a pair if  the previous character is xxx
					:with_pair(
						cond.not_before_regex("xxx", 3)
					)
					-- don't move right when repeat character
					:with_move(cond.none())
					-- don't delete if the next character is xx
					:with_del(cond.not_after_regex("xx"))
					-- disable adding a newline when you press <cr>
					:with_cr(cond.none()),
			},
			-- disable for .vim files, but it work for another filetypes
			Rule("a", "a", "-vim")
		)

		npairs.add_rules({
			Rule("$$", "$$", "tex"):with_pair(function(opts)
				print(vim.inspect(opts))
				if opts.line == "aa $$" then
					-- don't add pair on that line
					return false
				end
			end),
		})
	end,
}
