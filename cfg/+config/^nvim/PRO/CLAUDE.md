# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration written in Lua, using lazy.nvim as the plugin manager. The configuration is modular, with clear separation between boot initialization, plugin management, LSP configuration, keymaps, debugging, and filetype customization.

## Architecture

### Bootstrap Sequence (init.lua)

The configuration loads in this order:
1. `user.boot.globals` - Global utility functions (P, RELOAD, R, WriteLog, AppendLog, etc.)
2. `user.boot.dev` - Development utilities
3. `user.boot.options` - Neovim options (clipboard, tabs, search, backups, etc.)
4. `user.boot.vimcmd` - Vim autocommands
5. `user.lazy_boot` - Initializes lazy.nvim plugin manager
6. `user.lazy_list` - Defines all plugin specifications
7. `user.plug` - Plugin-specific configurations
8. `user.lsp` - LSP setup and configuration
9. `user.key` - Keymap definitions
10. `user.debug` - DAP (debugger) configuration
11. `user.conf` - Filetype detection and customization

### Directory Structure

```
lua/user/
├── boot/          - Bootstrap configuration (globals, options, vimcmd)
├── lazy/          - Lazy.nvim plugin specifications
├── plug/          - Plugin-specific configurations
├── lsp/           - LSP configuration
│   └── lang/      - Language-specific LSP configs (lua_ls, pyright, etc.)
├── key/           - Keymap definitions (map_leader, map_base, etc.)
├── debug/         - DAP debugger configuration
├── conf/          - Filetype detection and pane/terminal utils
└── util/          - Utility functions

snippets/          - Code snippets
```

### LSP Configuration System

LSP servers are managed through Mason with a custom configuration system in `lua/user/lsp/mason.lua`:

- `server_list` defines all LSP servers with a `cfg` flag
- Servers with `cfg = true` require a language-specific config file in `lua/user/lsp/lang/<server_name>.lua`
- Servers with `cfg = false` use default settings
- As of Neovim 0.11, use `vim.lsp.config(server_name, opts)` instead of `require('lspconfig')[server_name].setup(opts)`

Current LSP servers:
- bashls, dockerls, elixirls, emmet_ls (custom), html, jsonls (custom), lua_ls (custom), marksman, pyright (custom), sqlls, terraformls, tailwindcss (custom), ts_ls, zls

### Plugin Management

Plugins are organized by category in `lua/user/lazy_list.lua`:
- **NEOVIM BASICS**: popup, plenary
- **NVIM-TREE**: devicons, neotree
- **TREESITTER**: treesitter, playground, comment, textobj
- **TERMINAL**: tmux integration, toggleterm
- **NOICE**: command line & notifications
- **GIT**: gitsigns, git blame
- **LSP**: lspconfig, mason, none-ls
- **WHICH-KEY**: mini utilities, which-key mapper
- **CMP**: blink.cmp for completion
- **AI TOOLING**: aider, claude code
- **TELESCOPE**: fuzzy finder, easypick
- **EDITING UTILS**: table mode, easy align, spectre, grug-far
- **LANG SPECIFIC**: JSON/YAML tools, Elixir, Justfiles, Markdown

Individual plugin configs requiring setup go in `lua/user/lazy/` (e.g., `ai_claude.lua`, `lsp_config.lua`), while simple plugin strings are listed directly in `lua/user/lazy_list.lua`.

Plugin configurations that need more customization go in `lua/user/plug/`.

### Keymap Organization

Keymaps are split across multiple files in `lua/user/key/`:
- `map_base.lua` - Basic keymaps
- `map_bracket.lua` - Bracket-related mappings
- `map_leader.lua` - Leader key mappings (primary interface)
- `map_slash.lua`, `map_dash.lua` - Special prefix mappings
- `map_a.lua`, `map_g.lua`, `map_z.lua` - Specific key prefix mappings

Leader key groups include:
- `<leader>c` - Claude Code operations
- `<leader>d` - Debugger (DAP)
- `<leader>e` - Explorer (Neotree)
- `<leader>f` - Find (Telescope)
- `<leader>g` - Git operations
- `<leader>l` - Layout/window management
- `<leader>m` - Markdown
- `<leader>a` - Alternate files (projectionist)

### Global Utilities

Available global functions (defined in `lua/user/boot/globals.lua`):
- `P(val)` - Print and inspect a value
- `RELOAD(module)` - Reload a Lua module
- `R(name)` - Reload and require a module
- `WriteLog(message)` - Overwrite /tmp/nvim.log
- `AppendLog(message)` - Append to /tmp/nvim.log
- `AppendTbl(table)` - Append table to log
- `TblFilter(tbl, string)` - Filter table by key string
- `ToString(tbl, indent)` - Convert table to string
- `Timestamp()` - Get current timestamp
- `:TabnewWithCursor` - Open file in new tab preserving cursor
- `:TabnewWithCursorAndJump` - Same but jump to definition

## Development Workflow

### LSP Management

```vim
:Mason                    " Open Mason GUI
:MasonInstall <pkg>       " Install LSP server
:MasonLog                 " View Mason log (~/.local/state/nvim/mason.log)
:LspInfo                  " Show active LSP clients
:Format                   " Format current buffer with LSP
```

### Debugging

The config includes DAP (Debug Adapter Protocol) support with configurations in `lua/user/debug/`. Currently configured for Lua debugging.

### Testing/Reloading

Use the global `R()` function to reload modules during development:
```lua
:lua R("user.plug.telescope")  -- Reload and re-require a module
```

### Logging

Log files are located at:
- Mason: `~/.local/state/nvim/mason.log`
- LSP: `~/.local/state/nvim/lsp.log`
- Custom: `/tmp/nvim.log` (via WriteLog/AppendLog)

## Language Support

### Elixir
- Mix format integration (vim-mix-format)
- File navigation via projectionist
- Syntax highlighting and filetype detection

### Markdown
- Preview with markdown-peek
- Bullet list management
- Obsidian-ready

### JSON/YAML
- SchemaStore integration for JSON and YAML
- YAML companion for schema selection
- JSON text objects and formatting

### Justfiles
- Syntax highlighting and support for Justfiles

## Important Notes

- The config uses 2-space indentation (tabs converted to spaces)
- Leader timeout is 1000ms
- Clipboard is shared with system (unnamedplus)
- No swap files, backup files, or writebackup
- Line numbers are absolute (not relative)
- LSP virtual text is disabled; diagnostics shown via signs and floating windows
- Claude Code integration is mapped to `<leader>c` prefix
