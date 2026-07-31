return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.2",
	cmd = "Telescope",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{
			"<leader>pf",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find files",
		},
		{
			"<C-p>",
			function()
				require("telescope.builtin").git_files()
			end,
			desc = "Find Git files",
		},
		{
			"<leader>pws",
			function()
				require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
			end,
			desc = "Search word under cursor",
		},
		{
			"<leader>pWs",
			function()
				require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") })
			end,
			desc = "Search WORD under cursor",
		},
		{
			"<leader>ps",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>vh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Search help",
		},
	},
}
