-- claude
--
-- AI Pair-Programming Tool
--
-- # CLAUDE
--
-- https://claude.com/product/claude-code
--
-- # CLAUDECODE.NVIM
--
-- https://github.com/coder/claudecode.nvim
--
-- Commands:
-- :ClaudeCode
-- :ClaudeCodeSend
-- etc...

-- Use "IDE Mode" to run claude in a standalone session.
-- This is useful for working on large 'monolith' projects.
-- The script `nv_ide` sets `IDE_MODE=true`.
-- Then you launch claude using `claude --ide`
-- (use the alias `claude_ide`)
-- see https://github.com/coder/claudecode.nvim?tab=readme-ov-file#none-no-op-provider

local ide_opts = {
  terminal = {
    provider = "none", -- no UI actions; server + tools remain available
  },
}

local opts = (os.getenv("IDE_MODE") == "true") and ide_opts or {}

local claude_opts = {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  opts = opts,

  --
  -- KEYS DEFINED IN `map_leader.lua`
  --
  -- keys = {
  --   { "<leader>a", nil, desc = "AI/Claude Code" },
  --   { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
  --   { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
  --   { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
  --   { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
  --   { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
  --   { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
  --   { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
  --   {
  --     "<leader>as",
  --     "<cmd>ClaudeCodeTreeAdd<cr>",
  --     desc = "Add file",
  --     ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
  --   },
  --   -- Diff management
  --   { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
  --   { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  -- },
}

return claude_opts
