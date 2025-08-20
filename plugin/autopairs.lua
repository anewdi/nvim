require("nvim-autopairs").setup()

local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")
require("nvim-autopairs").add_rules({
	Rule("\\[", "\\]", { "tex", "latex" })
		--Dont do double
		:with_pair(cond.not_after_regex("\\]", 2))
		:with_pair(cond.not_inside_quote()),

	Rule("\\(", "\\)", { "tex", "latex" })
		--Dont do double
		:with_pair(cond.not_after_regex("\\)", 2))
		:with_pair(cond.not_inside_quote()),

	Rule("\\left", "(\\right)", { "tex", "latex" }):with_pair(cond.not_inside_quote()),
})
