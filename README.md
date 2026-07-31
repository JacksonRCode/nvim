# Neovim configuration

See [CHEATSHEET.md](CHEATSHEET.md) for custom mappings and useful commands.

A small Lua-based Neovim setup built around lazy.nvim, native Neovim LSP,
Blink completion, Treesitter, Telescope, Harpoon, Neo-tree, Conform, Trouble,
Diffview, nvim-lint, and nvim-surround.

## Requirements

- Neovim 0.11 or newer
- Git and ripgrep
- A C compiler for Treesitter parsers
- A Nerd Font for icons

Language servers, formatters, and linters are installed through Mason on first
use. ESLint, PHPStan, and SQLFluff only run in projects containing their
respective configuration files; Ruff runs for Python files by default.

## Useful commands

- `:Lazy` — manage plugins
- `:Mason` — manage language tools
- `:ConformInfo` — inspect formatter availability
- `:LspInfo` — inspect active language servers
- `:Trouble diagnostics` — open workspace diagnostics
- `:DiffviewOpen` — review the current Git changes
- `:checkhealth` — run Neovim and plugin diagnostics

Useful key groups are shown automatically by Which-key. Start with `<leader>p`
for search, `<leader>g` for Git, `<leader>q` for diagnostics and lists, and
`<leader>c` for code actions. Press `<leader>?` to inspect buffer-local maps.

Surrounding pairs use `ys{motion}{char}` to add, `ds{char}` to delete, and
`cs{target}{replacement}` to change. For example, `ysiw"` surrounds a word
with quotes.

## Maintenance

Run `:Lazy update` to update plugins, then `:TSUpdate` to keep Treesitter
parsers compatible. Review `lazy-lock.json` in Git before committing updates.

Original learning resources:

- <https://www.youtube.com/watch?v=w7i4amO_zaE&t=396s>
- <https://www.youtube.com/watch?v=KYDG3AHgYEs>
