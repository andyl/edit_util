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
    require("markview").setup({
      tables = { enable = false },
      callbacks = {
        on_enable = function(_, _)
        end,
        on_disable = function(_, _)
        end,
      },
    })
    vim.cmd("Markview disableAll")
  end,

}

return opts
