return {
	"linrongbin16/gitlinker.nvim",
	cmd = "GitLink",
	opts = {},
	keys = {
		{ "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link to blob" },
		{ "<leader>gyb", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link in browser" },
		{
			"<leader>gc",
			"<cmd>GitLink current_branch<cr>",
			mode = { "n", "v" },
			desc = "Yank git link to current branch",
		},
		{
			"<leader>gcb",
			"<cmd>GitLink current_branch<cr>",
			mode = { "n", "v" },
			desc = "Open git link in current branch",
		},
		{
			"<leader>gd",
			"<cmd>GitLink default_branch<cr>",
			mode = { "n", "v" },
			desc = "Yank git link to default branch",
		},
		{
			"<leader>gdb",
			"<cmd>GitLink! default_branch<cr>",
			mode = { "n", "v" },
			desc = "Open git link in default branch",
		},
		{ "<leader>gb", "<cmd>GitLink! blame<cr>", mode = { "n", "v" }, desc = "Open git blame link" },
	},
}
