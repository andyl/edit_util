-- jy_ymlcom
--
-- Yaml Companion
--
-- https://github.com/someone-stole-my-name/yaml-companion.nvim
--
-- https://www.arthurkoziel.com/json-schemas-in-neovim/
--
-- As of 2024 Aug 02 Fri: doesn't work...


local opts = {
  'someone-stole-my-name/yaml-companion.nvim',
  requires = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
  },
  config = function()
    require('yaml-companion').setup()
    require("telescope").load_extension("yaml_schema")
  end,
}

return opts
