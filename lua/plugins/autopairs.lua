return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true,

	init = function()
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		npairs.add_rules({

			Rule("\\[", "\\]", { "tex", "latex" })
				--Dont do double
				:with_pair(cond.not_after_regex("\\]", 2))
				:with_pair(cond.not_inside_quote()),

			Rule("\\(", "\\)", { "tex", "latex" })
				--Dont do double
				:with_pair(cond.not_after_regex("\\)", 2))
				:with_pair(cond.not_inside_quote()),

			Rule("\\left", "(\\right)", { "tex", "latex" }):with_pair(cond.not_inside_quote()),

			Rule("\\begin{.*}", "", { "tex", "latex" })
				:use_regex(true)
				:replace_endpair(function(opts)
					return "\\end" .. opts.prev_char:sub(string.find(opts.prev_char, "{"), #opts.prev_char)
				end)
				:end_wise(),
		})
	end,
}
