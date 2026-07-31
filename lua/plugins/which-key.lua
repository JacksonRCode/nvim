return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = 300,
		spec = {
			{ "<leader>c", group = "Code" },
			{ "<leader>g", group = "Git" },
			{ "<leader>p", group = "Search" },
			{ "<leader>q", group = "Lists / diagnostics" },
			{ "<leader>t", group = "Toggle" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer-local keymaps",
		},
	},
}
