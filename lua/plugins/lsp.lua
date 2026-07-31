return {
	-- Main LSP Configuration
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"saghen/blink.cmp",
	},
	config = function()
		-- Servers to install and configure
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
						diagnostics = { globals = { "vim" } },
					},
				},
			},
			ts_ls = {}, -- Node.js / JavaScript
			html = {},
			cssls = {},
			pyright = {},
			sqlls = {},
			intelephense = {},
		}

		-- 1. FORCE DIAGNOSTIC TEXT TO APPEAR
		vim.diagnostic.config({
			virtual_text = true, -- Shows text inline next to your code
			signs = true,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})
		for server_name, server in pairs(servers) do
			vim.lsp.config(server_name, server)
		end

		-- Ensure servers listed above are automatically installed
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua",
			"prettier",
			"isort",
			"black",
			"php-cs-fixer",
			"sql-formatter",
			"eslint_d",
			"ruff",
			"phpstan",
			"sqlfluff",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			automatic_enable = vim.tbl_keys(servers),
		})

		-- Keybinds that activate when an LSP connects to a buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				local client = vim.lsp.get_client_by_id(event.data.client_id)

				-- Navigation (Telescope based)
				map("gd", function()
					require("telescope.builtin").lsp_definitions()
				end, "[G]oto [D]efinition")
				map("gr", function()
					require("telescope.builtin").lsp_references()
				end, "[G]oto [R]eferences")
				map("gI", function()
					require("telescope.builtin").lsp_implementations()
				end, "[G]oto [I]mplementation")
				map("<leader>D", function()
					require("telescope.builtin").lsp_type_definitions()
				end, "Type [D]efinition")
				map("<leader>ds", function()
					require("telescope.builtin").lsp_document_symbols()
				end, "[D]ocument [S]ymbols")
				map("<leader>ws", function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols()
				end, "[W]orkspace [S]ymbols")
				-- Refactoring & Documentation
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					map("<leader>th", function()
						local filter = { bufnr = event.buf }
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(filter), filter)
					end, "[T]oggle inlay [H]ints")
				end

				-- Diagnostic Helpers
				map("<leader>e", vim.diagnostic.open_float, "Show full [E]rror message")
				map("[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, "Previous [D]iagnostic")
				map("]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, "Next [D]iagnostic")

				-- Highlight word under cursor
				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})
	end,
}
