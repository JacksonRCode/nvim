return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		-- vim.keymap.set("n", "<leader>ee", "<Cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" }),
		keys = {
			{
				"<leader>ee",
				"<cmd>Neotree toggle<cr>",
				desc = "Toggle Explorer",
			},
		},

		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				popup_border_style = "NC",
				enable_git_status = true,
				enable_diagnostics = true,
				filesystem = {
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = false,
					},
					bind_to_cwd = false,
					follow_current_file = { enabled = true },
					use_libuv_file_watcher = true,
				},
				default_component_configs = {
					icon = {
						folder_closed = "",
						folder_open = "",
						folder_empty = "󰜌",
						provider = function(icon, node, state)
							if node.type == "file" or node.type == "terminal" then
								local success, web_devicons = pcall(require, "nvim-web-devicons")
								local name = node.type == "terminal" and "terminal" or node.name
								if success then
									local devicon, hl = web_devicons.get_icon(name)
									icon.text = devicon or icon.text
									icon.highlight = hl or icon.highlight
								end
							end
						end,
					},
				},
			})
		end,
	},
}
