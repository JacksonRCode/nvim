local general = vim.api.nvim_create_augroup("general-settings", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = general,
	desc = "Highlight yanked text",
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = general,
	desc = "Return to the last edit position",
	callback = function(event)
		local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(event.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
