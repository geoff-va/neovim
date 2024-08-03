local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

-- Return current start/end line
local get_lines = function()
	local start_line = vim.fn.line("v")
	local end_line = vim.fn.line(".")
	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end
	return start_line, end_line
end

-- Show a telescope picker for gitlinks
local gitlinks_picker = function(opts)
	opts = opts or {}
	local lstart, lend = get_lines()
	local linker = require("gitlinker")
	local linker_actions = require("gitlinker.actions")
	pickers
		.new(opts, {
			results_title = "GitLinks",
			prompt_title = "<ctrl-o> to open in browser",
			layout_strategy = "vertical",
			layout_config = { width = 40, height = 10 },
			finder = finders.new_table({
				results = {
					{ "Blob", "" },
					{ "Current Branch", "current_branch" },
					{ "Default Branch", "default_branch" },
					{ "Blame", "blame" },
				},
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry[1],
						ordinal = entry[1],
						router = entry[2],
					}
				end,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					linker.link({
						action = linker_actions.clipboard,
						lstart = lstart,
						lend = lend,
						router_type = selection["router"],
					})
				end)
				map({ "i", "n" }, "<c-o>", function(prompt_bufnr)
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					linker.link({
						action = linker_actions.system,
						lstart = lstart,
						lend = lend,
						router_type = selection["router"],
					})
				end, { desc = "Open GitLink in Browser" })
				return true
			end,
		})
		:find()
end

return {
	"linrongbin16/gitlinker.nvim",
	cmd = "GitLink",
	opts = {},
	keys = {
		{ "<leader>gl", gitlinks_picker, mode = { "n", "v" }, desc = "Open GitLink Picker" },
	},
}
