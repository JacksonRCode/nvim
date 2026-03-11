return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto", -- Matches your colorscheme automatically
				globalstatus = true, -- One statusline for all windows (cleaner look)
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_x = { "encoding", "fileformat", "filetype" },
			},
		})
	end,
}
