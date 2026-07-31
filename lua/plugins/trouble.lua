return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{ "<leader>qd", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace diagnostics" },
		{ "<leader>qD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
		{ "<leader>qs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Document symbols" },
		{
			"<leader>ql",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP definitions / references",
		},
		{ "<leader>qq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
		{ "<leader>qL", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
	},
}
