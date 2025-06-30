-- aider
--
-- AI Pair-Programming Tool
--
-- # AIDER
--
-- https://aider.chat
--
-- Use `install_aider` to install or update...
-- Run aider --help to see all the options you can pass to the CLI.
--
-- # AIDER.NVIM
--
-- https://github.com/joshuavial/aider.nvim
--
-- Commands:
-- :AiderOpen
-- :AiderOpen -3 hsplit
-- :AiderOpen "AIDER_NO_AUTO_COMMITS=1 aider -3" editor
-- :AiderAddModifiedFiles
--
-- The plugin provides the following default keybindings:
-- <leader>Ao: Open a terminal window with the Aider defaults (gpt-4).
-- <leader>Am: Add all git-modified files to the Aider chat.
-- <leader><space>: Open Aider (Deprecated - will be removed in a future version)
-- These keybindings are set up using which-key, providing a descriptive popup menu when you press <leader>A.
--
-- Tips for Working with Buffers in Vim
-- :ls or :buffers to see all open buffers.
-- :b <number> or :buffer <number> to switch to a specific buffer. Replace <number> with the buffer number.
-- :bd or :bdelete to close the current buffer.
-- :bd <number> or :bdelete <number> to close a specific buffer. Replace <number> with the buffer number.
-- :bufdo bd to close all buffers.

local aider_opts = {
  "joshuavial/aider.nvim",
  opts = {
    auto_manage_context = true, -- automatically manage buffer context
    default_bindings = true,    -- use default <leader>A keybindings
    debug = false,              -- enable debug logging
    ignore_buffers = {},        -- list of buffers to ignore
  },
}

return aider_opts
