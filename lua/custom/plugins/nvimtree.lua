-- https://github.com/alex-courtis/arch/blob/39a1ba4ecc3d356bb660a489d3648b987ecd9a85/config/nvim/lua/amc/plugins/nvt.lua#L20
local function on_attach(bufnr)
	local api = require("nvim-tree.api")
	local telescope = require("telescope.builtin")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	local function node_dir_path()
		local node = api.tree.get_node_under_cursor()
		if not node then
			return
		end

		if node.parent and node.type == "file" then
			node = node.parent
		end

		return node.absolute_path
	end

	local function find_files()
		telescope.find_files({ search_dirs = { node_dir_path() } })
	end

	local function live_grep()
		telescope.live_grep({ search_dirs = { node_dir_path() }, additional_args = { "--no-ignore" } })
	end

	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.set("n", "<leader>sf", find_files, opts("Find Files In Folder"))
	vim.keymap.set("n", "<leader>sg", live_grep, opts("Live Grep Folder"))
end

return {
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			live_filter = {
				prefix = "[FILTER]: ",
				always_show_folders = false, -- Turn into false from true by default
			},
			on_attach = on_attach,
			-- nvim-project settings
			sync_root_with_cwd = true,
			actions = {
				change_dir = {
					global = true,
				},
			},
			update_focused_file = {
				enable = true,
				update_cwd = false,
			},
			renderer = {
				root_folder_modifier = ":t",
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_open = "",
							arrow_closed = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							untracked = "U",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			view = {
				width = 35,
				side = "left",
			},
		},
	},
}
