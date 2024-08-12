-- md_markview
-- https://github.com/OXY2DEV/markview.nvim

local opts = {
  "OXY2DEV/markview.nvim",

  lazy = false,

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },

  config = function()
    -- vim.cmd("Markview disableAll<cr>")
    -- require("markview").setup({
    --   tables = {
    --     enable = false,
    --   }
    -- })
  end,

}

return opts
