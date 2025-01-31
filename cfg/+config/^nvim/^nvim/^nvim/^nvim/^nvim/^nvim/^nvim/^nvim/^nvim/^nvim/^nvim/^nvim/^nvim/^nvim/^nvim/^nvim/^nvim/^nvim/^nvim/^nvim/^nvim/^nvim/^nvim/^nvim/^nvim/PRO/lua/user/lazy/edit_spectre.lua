-- edit_spectre
--
-- Project-wide search-and-replace for Neovim.
--
-- https://github.com/nvim-pack/nvim-spectre
-- https://www.lazyvim.org/plugins/editor#nvim-spectre
--
-- Cantu Video   | https://www.youtube.com/watch?v=yfDb2QrjcZo&t=2s
-- Courter Video | https://www.youtube.com/watch?v=YzVmdJ41Xkg&t=194s

local opts = {
  "nvim-pack/nvim-spectre",
  build = false,
  cmd = "Spectre",
  dependencies = {
    "folke/trouble.nvim",
  },
  opts = { open_cmd = "noswapfile vnew" },
}

return opts

