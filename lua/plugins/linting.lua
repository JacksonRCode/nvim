local project_markers = {
	javascript = {
		"eslint.config.js",
		"eslint.config.mjs",
		"eslint.config.cjs",
		"eslint.config.ts",
		".eslintrc",
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.json",
		".eslintrc.yaml",
		".eslintrc.yml",
	},
	php = { "phpstan.neon", "phpstan.neon.dist", "phpstan.dist.neon" },
	sql = { ".sqlfluff" },
}

local function project_root(bufnr, markers)
	local path = vim.api.nvim_buf_get_name(bufnr)
	return path ~= "" and vim.fs.root(path, markers) or nil
end

local function lint_buffer(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	if vim.bo[bufnr].buftype ~= "" then
		return
	end

	local filetype = vim.bo[bufnr].filetype
	local marker_group = vim.tbl_contains(
		{ "javascript", "javascriptreact", "typescript", "typescriptreact" },
		filetype
	) and project_markers.javascript or project_markers[filetype]
	local cwd = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
	if marker_group then
		cwd = project_root(bufnr, marker_group)
		if not cwd then
			return
		end
	end

	require("lint").try_lint(nil, { cwd = cwd })
end

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>cl",
			function()
				lint_buffer()
			end,
			desc = "Lint buffer",
		},
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			python = { "ruff" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			php = { "phpstan" },
			sql = { "sqlfluff" },
		}

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("lint-on-change", { clear = true }),
			desc = "Lint the current buffer when an appropriate project config exists",
			callback = function(event)
				lint_buffer(event.buf)
			end,
		})
	end,
}
