-- lsp_tw_tools.lua
-- https://github.com/luckasRanarison/tailwind-tools.nvim
--
-- 2025 Jul 23 Wed - This conflicts with the 'speeddating.nvim' plugin

local opts = {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- optional
    "neovim/nvim-lspconfig", -- optional
  },
  opts = {} -- your configuration
}

return opts
