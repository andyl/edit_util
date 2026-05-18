-- claude - AI Pair-Programming Tool
--
-- CLAUDE          | https://claude.com/product/claude-code
-- CLAUDECODE.NVIM | https://github.com/coder/claudecode.nvim
--
-- Commands:
-- :ClaudeCode
-- :ClaudeCodeSend
-- :etc...
--
-- Use "IDE Mode" to run claude in a standalone session.
-- This is useful for working on large 'monolith' projects.
-- The script `nv_ide` sets `IDE_MODE=true`.
-- Then you launch claude using `claude --ide` (use the alias `claude_ide`)
-- see https://github.com/coder/claudecode.nvim?tab=readme-ov-file#none-no-op-provider
--
-- HOTKEYS DEFINED IN `map_leader.lua`
--
-- We frequently get this error message:
-- [ClaudeCode] [init] [ERROR] Failed to start Claude Code server: Failed to listen on port 57388: EADDRINUSE: address already in use
-- Press ENTER or type command to continue

-- Show diffs inline in the claude window, rather than open a neovim diff window
local diff_cfg = {
  diff_opts = {
    open_in_current_tab = false
  }
}

-- Config for IDE usage.  Claude runs in separate terminal.
local terminal_ide_cfg = {
  terminal = {
    provider = "none", -- no UI actions; server + tools remain available
  },
}

-- Config for IDE usage.  Claude runs in nvim session.
local terminal_inline_cfg = {
  terminal = {
    split_width_percentage = 0.50 -- Claude takes 50% of screen width
  }
}

local terminal_cfg = (os.getenv("IDE_MODE") == "true") and terminal_ide_cfg or terminal_inline_cfg

local port_opts = {
  port_range = { min = 51510, max = 51700 }
}

local opts = vim.tbl_deep_extend("force", diff_cfg, terminal_cfg, port_opts)

local claude_opts = {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  opts = opts,
}

return claude_opts
