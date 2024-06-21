return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = [[<C-\>]],
		autochdir = true,
		size = function(term)
			if term.direction == "horizontal" then
				return 20
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
	},
}
