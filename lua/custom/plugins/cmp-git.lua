return {
	"petertriho/cmp-git",
	dependencies = { "hrsh7th/nvim-cmp" },
	enabled = false,
	opts = {
		-- options go here
	},
	init = function()
		table.insert(require("cmp").get_config().sources, { name = "git" })
	end,
}
