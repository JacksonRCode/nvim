return {
	"sindrets/diffview.nvim",
	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
		"DiffviewFileHistory",
	},
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Review working tree" },
		{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Current file history" },
		{ "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Repository history" },
		{ "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
	},
	opts = {
		enhanced_diff_hl = true,
		view = {
			merge_tool = {
				layout = "diff3_mixed",
			},
		},
	},
}
