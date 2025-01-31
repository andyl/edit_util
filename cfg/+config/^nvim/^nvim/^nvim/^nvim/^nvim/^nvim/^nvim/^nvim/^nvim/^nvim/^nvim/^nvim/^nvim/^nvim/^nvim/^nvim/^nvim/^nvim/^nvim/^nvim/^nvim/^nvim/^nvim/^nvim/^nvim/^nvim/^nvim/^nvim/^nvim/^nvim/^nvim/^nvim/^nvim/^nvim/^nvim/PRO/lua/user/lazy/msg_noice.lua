-- msg_noice
--
-- Command Line and Notifications
--
-- https://github.com/folke/noice.nvim
--

local function skip_notifications_with(term)
  return { filter = { event = "notify", find = term }, opts = { skip = true } }
end

local function skip_messages_with(term)
  return { filter = { find = term }, opts = { skip = true } }
end

local opts = {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      routes = {
        skip_notifications_with("cannot close the last tab"),
        skip_notifications_with("toggleterm"),
        skip_messages_with("written"),
        skip_messages_with("terminal.lua"),
        skip_messages_with("only one window"),
      }
    })
  end
}

return opts
