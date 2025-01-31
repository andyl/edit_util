-- Neovim Config
-- ~/.config/nvim/init.lua

require "user.globals"       -- global configuration
require "user.util.dev"      -- development utilities
require "user.options"       -- config options
require "user.vimcmd"        -- vim commands (autocommands)
require "user.lazy_boot"     -- lazy installation
require "user.lazy_list"     -- lazy plugin specifications
require "user.plug"          -- plugin configuration
require "user.pane"          -- pane utilities (resizing)
require "user.term"          -- terminal configuration
require "user.key"           -- keymap setup
require "user.lsp"           -- lsp configuration
require "user.debug"         -- dap configuration
require "user.filetypes"     -- filetype detection and customization

