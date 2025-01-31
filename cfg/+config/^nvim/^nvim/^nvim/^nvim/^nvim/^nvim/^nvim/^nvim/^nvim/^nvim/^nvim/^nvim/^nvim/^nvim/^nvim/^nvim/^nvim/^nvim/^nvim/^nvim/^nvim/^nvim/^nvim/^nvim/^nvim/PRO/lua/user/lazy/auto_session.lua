-- auto_session
--
-- Automatic session management
--
-- https://github.com/rmagatti/auto-session
-- https://youtu.be/c9y7bKk-R7U?t=365

local lcl_opts = {
  "rmagatti/auto-session",
  lazy = false,

  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    bypass_save_filetypes = { 'neo-tree' },
  }
}

return lcl_opts
