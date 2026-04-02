-- ts_treesitter
--

local lcl_opts = {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

return lcl_opts
