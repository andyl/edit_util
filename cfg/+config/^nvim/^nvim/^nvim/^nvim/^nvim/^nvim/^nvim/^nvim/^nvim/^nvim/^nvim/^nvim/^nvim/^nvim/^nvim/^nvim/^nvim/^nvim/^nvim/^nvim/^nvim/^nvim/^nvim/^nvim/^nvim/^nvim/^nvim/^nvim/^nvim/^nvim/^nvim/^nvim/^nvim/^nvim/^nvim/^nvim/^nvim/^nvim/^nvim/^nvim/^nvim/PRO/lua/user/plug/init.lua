-- Plugin Config

require("user.plug.ack")
require("user.plug.colorscheme")
require("user.plug.telescope")
require("user.plug.navigation")
require("user.plug.lualine")
require("user.plug.mkdx")
require("user.plug.tabline")
require("user.plug.comment")
require("user.plug.treesitter")
require("user.plug.easypick")
require("user.plug.nvim-tree")   -- deprecated file explorer - replaced by neotree
require("user.plug.neodev")      -- dev utilities
require("user.plug.speeddating") -- date increment/decrement with C-a and C-x

require('aider').setup({
  auto_manage_context = false,
  default_bindings = false
})
