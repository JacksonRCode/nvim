return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup() -- Initialize Harpoon

        -- Add file to Harpoon list
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add file to list" })

        -- Toggle Harpoon menu
        vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Toggle menu" })

        -- Navigate to specific marked files
        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon: Go to file 1" })
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "Harpoon: Go to file 2" })
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "Harpoon: Go to file 3" })
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "Harpoon: Go to file 4" })

    end,
}
