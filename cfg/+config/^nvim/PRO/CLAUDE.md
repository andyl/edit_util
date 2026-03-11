# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration in Lua, using lazy.nvim as the plugin manager. This repo lives in `edit_util/cfg/+config/^nvim/PRO` and deploys to `~/.config/nvim/PRO`. The config targets Neovim 0.11+.

## Bootstrap Sequence (init.lua)

The configuration loads in strict order:
1. `user.boot.globals` - Global utility functions (P, RELOAD, R, WriteLog, AppendLog, etc.)
2. `user.boot.dev` - Development utilities
3. `user.boot.options` - Neovim options
4. `user.boot.vimcmd` - Vim autocommands
5. `user.lazy_boot` - Initializes lazy.nvim
6. `user.lazy_list` - All plugin specifications
7. `user.plug` - Plugin-specific configurations (post-install setup)
8. `user.lsp` - LSP setup: lspconfig, mason, handlers, none-ls
9. `user.key` - Keymap definitions
10. `user.debug` - DAP debugger configuration
11. `user.conf` - Filetype detection, pane utils, terminal navigation

## Key Architectural Patterns

### Two-Layer Plugin Configuration

Plugins have two configuration touchpoints:

- **`lua/user/lazy/`** - Lazy.nvim spec tables returned via `require()` in `lazy_list.lua`. These define the plugin repo, dependencies, and `config`/`opts` for lazy.nvim. Naming convention: `<category>_<name>.lua` (e.g., `lsp_config.lua`, `ts_treesitter.lua`, `ai_claude.lua`). The `cmp/` subdirectory holds completion config (`cmp/core.lua`).

- **`lua/user/plug/`** - Post-install setup that runs after all plugins are loaded (phase 7). Used for plugins needing imperative `.setup()` calls or runtime configuration (telescope, lualine, colorscheme, etc.). Loaded via `plug/init.lua`.

Simple plugins that need no configuration are listed as bare strings in `lazy_list.lua`.

### LSP Configuration System

Managed in `lua/user/lsp/mason.lua` via a `server_list` table:

- Each entry has `{ name = "server", cfg = true|false }`
- `cfg = true` servers load custom options from `lua/user/lsp/lang/<server_name>.lua` and apply them via `vim.lsp.config(server_name, opts)` (Neovim 0.11 API)
- `cfg = false` servers use Mason defaults
- `lua/user/lsp/handlers.lua` configures diagnostics (virtual text disabled, signs + floating windows), document highlighting, and the `:Format` command

To add a new LSP server: add an entry to `server_list` in `mason.lua`. If it needs custom config (`cfg = true`), create the corresponding file in `lua/user/lsp/lang/`.

### Keymap Organization

All keymaps are in `lua/user/key/`, split by prefix:
- `map_leader.lua` - Primary interface (`<leader>` groups: c=Claude, d=DAP, e=Explorer, f=Find, g=Git, l=Layout, m=Markdown, a=Alternate)
- `map_base.lua` - Non-leader keymaps
- `map_bracket.lua`, `map_slash.lua`, `map_dash.lua`, `map_a.lua`, `map_g.lua`, `map_z.lua` - Prefix-specific mappings
- `conf.lua` - WhichKey group registration

### Safety Pattern

Modules use `pcall` guards for optional dependencies:
```lua
local ok, module = pcall(require, "some-plugin")
if not ok then return end
```

### Snippets

Snippets are authored in snipmate format (`snippets/<lang>.snippets`) and converted to VSCode JSON format (`snippets/json/<lang>.json`) using the `Snipcon` and `Regen` scripts. Blink.cmp reads from `snippets/json/list/` (registered via `package.json`).

## Global Utilities (boot/globals.lua)

- `P(val)` - Print and inspect a value
- `R(name)` - Reload and require a module (uses plenary)
- `WriteLog(msg)` / `AppendLog(msg)` / `AppendTbl(tbl)` - Log to `/tmp/nvim.log`
- `ToString(tbl, indent)` / `TblFilter(tbl, string)` - Table utilities
- `:TabnewWithCursor` / `:TabnewWithCursorAndJump` - Tab commands preserving cursor

## Development Workflow

```vim
:Mason                    " Open Mason GUI
:MasonInstall <pkg>       " Install LSP server
:LspInfo                  " Show active LSP clients
:Format                   " Format buffer with LSP
:lua R("user.plug.telescope")  " Hot-reload a module
```

Log locations:
- Mason: `~/.local/state/nvim/mason.log`
- LSP: `~/.local/state/nvim/lsp.log`
- Custom: `/tmp/nvim.log`

## Code Style

- 2-space indentation, tabs converted to spaces
- Lua files use `local` scoping; globals are only in `boot/globals.lua`
- Deprecation warnings are silenced (`vim.deprecate = function() end` in init.lua)
