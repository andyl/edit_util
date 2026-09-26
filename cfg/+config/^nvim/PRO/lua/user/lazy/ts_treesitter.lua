-- ts_treesitter
--

local lcl_opts = {
  'nvim-treesitter/nvim-treesitter',
  branch = "master", -- default branch is now 'main' (incompatible rewrite)
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

return lcl_opts
