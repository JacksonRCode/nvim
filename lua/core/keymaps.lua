-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable spacebars default behaviour
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- File explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })

-- Move commands (move highlighted text up or down)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append next line to current line
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in middle of screen with <CR> D and U
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over highlighted word without losing current copy buffer
vim.keymap.set("x", "<leader>p", '"_dP')

-- Copy to the system clipboard without replacing Neovim's internal yank.
local clipboard = require("core.clipboard")
vim.keymap.set("n", "<leader>y", clipboard.start_operator, {
	expr = true,
	desc = "Yank to system clipboard",
})
vim.keymap.set("x", "<leader>y", clipboard.visual, { desc = "Yank selection to system clipboard" })
vim.keymap.set("n", "<leader>Y", clipboard.line, { desc = "Yank line to system clipboard" })

-- Delete without copying
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { silent = true, desc = "Delete buffer" })

-- Toggle autocomplete
vim.keymap.set("n", "<leader>ac", function()
	vim.b.completion = vim.b.completion == false
	if not vim.b.completion then
		require("blink.cmp").cancel()
	end
	vim.notify("Autocomplete " .. (vim.b.completion and "enabled" or "disabled"))
end, { desc = "Toggle Autocomplete" })
