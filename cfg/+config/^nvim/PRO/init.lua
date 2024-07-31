-- Neovim Config
-- ~/.config/nvim/init.lua

require "user.boot.globals"  -- global configuration
require "user.boot.dev"      -- development utilities
require "user.boot.options"  -- config options
require "user.boot.vimcmd"   -- vim commands (autocommands)

require "user.lazy_boot"     -- lazy installation
require "user.lazy_list"     -- lazy plugin specifications

require "user.plug"            -- plugin configuration
require "user.lsp"             -- lsp configuration
require "user.key"             -- keymap setup
require "user.debug"           -- dap configuration
require "user.conf"            -- filetype detection and customization

