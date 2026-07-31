# Neovim command cheat sheet

`<leader>` is `Space`. LSP mappings are buffer-local and appear only after a
language server attaches. Press `<leader>?` at any time to show buffer-local
mappings with Which-key.

## Core editing

| Mapping           | Mode          | Action                                          |
| ----------------- | ------------- | ----------------------------------------------- |
| `<leader>y`       | Normal/visual | Yank to the system clipboard                    |
| `<leader>Y`       | Normal        | Yank the current line to the system clipboard   |
| `<leader>d`       | Normal/visual | Delete without replacing the current register   |
| `<leader>p`       | Visual        | Paste without replacing the current register    |
| `<leader>x`       | Normal        | Delete the current buffer                       |
| `<leader>ac`      | Normal        | Toggle completion for the current buffer        |
| `J` / `K`         | Visual        | Move the selection down/up while preserving it  |
| `J`               | Normal        | Join lines while preserving the cursor position |
| `<C-d>` / `<C-u>` | Normal        | Scroll half a page and recenter                 |
| `n` / `N`         | Normal        | Move through search results and recenter        |
| `<C-c>`           | Insert        | Leave insert mode                               |
| `Q`               | Normal        | Disabled                                        |

Plain `y` uses Neovim's internal registers. `<leader>y` writes to the system
clipboard while preserving both the unnamed register and register `0`.

## Files, search, and navigation

| Mapping       | Action                               |
| ------------- | ------------------------------------ |
| `<leader>ee`  | Toggle Neo-tree                      |
| `<leader>pv`  | Open netrw                           |
| `<leader>pf`  | Find files with Telescope            |
| `<C-p>`       | Find Git-tracked files               |
| `<leader>ps`  | Live grep                            |
| `<leader>pws` | Search for the word under the cursor |
| `<leader>pWs` | Search for the WORD under the cursor |
| `<leader>vh`  | Search Neovim help                   |
| `<leader>u`   | Toggle the undo tree                 |

## LSP and code actions

| Mapping      | Action                                          |
| ------------ | ----------------------------------------------- |
| `gd`         | Go to definition with Telescope                 |
| `gr`         | Find references with Telescope                  |
| `gI`         | Go to implementation with Telescope             |
| `gD`         | Go to declaration                               |
| `K`          | Show hover documentation                        |
| `<leader>D`  | Go to type definition                           |
| `<leader>ds` | Search document symbols                         |
| `<leader>ws` | Search workspace symbols                        |
| `<leader>rn` | Rename symbol                                   |
| `<leader>ca` | Code action                                     |
| `<leader>th` | Toggle inlay hints when supported by the server |
| `<leader>e`  | Show the diagnostic under the cursor            |
| `[d` / `]d`  | Previous/next diagnostic                        |
| `<leader>f`  | Format the current buffer                       |
| `<leader>cl` | Lint the current buffer                         |

## Diagnostics and lists

| Mapping      | Action                                    |
| ------------ | ----------------------------------------- |
| `<leader>qd` | Toggle workspace diagnostics              |
| `<leader>qD` | Toggle diagnostics for the current buffer |
| `<leader>qs` | Toggle document symbols                   |
| `<leader>ql` | Toggle LSP definitions/references view    |
| `<leader>qq` | Toggle the quickfix list                  |
| `<leader>qL` | Toggle the location list                  |

## Git and history

| Mapping      | Action                                  |
| ------------ | --------------------------------------- |
| `<leader>gd` | Review working-tree changes in Diffview |
| `<leader>gh` | Show history for the current file       |
| `<leader>gH` | Show repository history                 |
| `<leader>gc` | Close Diffview                          |

Gitsigns displays added, changed, and deleted lines in the sign column.

## Harpoon

| Mapping     | Action                          |
| ----------- | ------------------------------- |
| `<leader>a` | Add the current file to Harpoon |
| `<leader>h` | Toggle the Harpoon menu         |
| `<C-h>`     | Open Harpoon file 1             |
| `<C-j>`     | Open Harpoon file 2             |
| `<C-k>`     | Open Harpoon file 3             |
| `<C-l>`     | Open Harpoon file 4             |

## Surround editing

| Mapping                   | Action                      | Example                                |
| ------------------------- | --------------------------- | -------------------------------------- |
| `ys{motion}{char}`        | Add a surrounding pair      | `ysiw"` surrounds a word with quotes   |
| `ds{char}`                | Delete a surrounding pair   | `ds)` removes parentheses              |
| `cs{target}{replacement}` | Change a surrounding pair   | `cs"'` changes double to single quotes |
| `S{char}`                 | Surround a visual selection | Select text, then press `S)`           |

Opening delimiters add spaces; closing delimiters do not. For example, `ysiw(`
produces `( word )`, while `ysiw)` produces `(word)`.

## Completion and snippets

| Mapping             | Action                                       |
| ------------------- | -------------------------------------------- |
| `<C-y>`             | Accept the selected completion               |
| `<C-Space>`         | Open completion or documentation             |
| `<C-n>` / `<C-p>`   | Select next/previous completion              |
| `<C-e>`             | Hide completion                              |
| `<C-k>`             | Toggle signature help                        |
| `<Tab>` / `<S-Tab>` | Move forward/backward through snippet fields |

## Useful commands

| Command                  | Purpose                                          |
| ------------------------ | ------------------------------------------------ |
| `:Lazy`                  | View and manage plugins                          |
| `:Lazy update`           | Update plugins and the lockfile                  |
| `:Mason`                 | View installed language tools                    |
| `:ConformInfo`           | Inspect formatters for the current buffer        |
| `:LspInfo`               | Inspect attached and configured language servers |
| `:Trouble diagnostics`   | Open workspace diagnostics                       |
| `:DiffviewOpen`          | Review current Git changes                       |
| `:DiffviewFileHistory %` | Show history for the current file                |
| `:Telescope`             | Open a Telescope picker by name                  |
| `:Neotree toggle`        | Toggle the file explorer                         |
| `:UndotreeToggle`        | Toggle visual undo history                       |
| `:TSUpdate`              | Update Treesitter parsers                        |
| `:checkhealth`           | Run Neovim and plugin health checks              |

## Maintenance routine

1. Run `:Lazy update`.
2. Run `:TSUpdate`.
3. Run `:checkhealth`.
4. Review `lazy-lock.json` before committing updates.
