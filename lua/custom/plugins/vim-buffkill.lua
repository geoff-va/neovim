return {
	"qpkorr/vim-bufkill",
	keymaps = {
		vim.keymap.set("n", "<C-x>", ":BD<CR>", { desc = "Close Current Buffer" }),
		vim.keymap.set("n", "<leader>bq", ":BD<CR>", { desc = "Close Current Buffer" }),
	},
}
