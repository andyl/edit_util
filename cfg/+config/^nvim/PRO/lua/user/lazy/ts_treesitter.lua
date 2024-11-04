-- ts_treesitter
--

local lcl_opts = {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufReadPost", "BufNewFile" },
}

return lcl_opts
