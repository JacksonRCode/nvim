local function harpoon()
	return require("harpoon")
end

local function select_file(index)
	return function()
		harpoon():list():select(index)
	end
end

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{
			"<leader>a",
			function()
				harpoon():list():add()
			end,
			desc = "Harpoon: Add file",
		},
		{
			"<leader>h",
			function()
				harpoon().ui:toggle_quick_menu(harpoon():list())
			end,
			desc = "Harpoon: Toggle menu",
		},
		{ "<C-h>", select_file(1), desc = "Harpoon: Go to file 1" },
		{ "<C-j>", select_file(2), desc = "Harpoon: Go to file 2" },
		{ "<C-k>", select_file(3), desc = "Harpoon: Go to file 3" },
		{ "<C-l>", select_file(4), desc = "Harpoon: Go to file 4" },
	},
}
