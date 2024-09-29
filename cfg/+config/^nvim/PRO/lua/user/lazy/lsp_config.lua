-- lsp_config
--
-- Quickstart configs for NVIM LSP
-- Color display for CSS & Tailwind classes

return {

  {
    -- https://github.com/neovim/nvim-lspconfig
    -- : h lspconfig.txt
    'neovim/nvim-lspconfig'
  },

  {
    -- https://github.com/NvChad/nvim-colorizer.lua
    -- https://www.youtube.com/watch?v=_NiWhZeR-MY&t=30s
    'NvChad/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup({
        user_default_options = {
          css         = true,
          RGB         = true,
          RRGGBB      = true,
          tailwind    = true,
          virtualtext = "■",
        },
        filetypes = {
          '*',
          '!md',
          '!markdown'
        }
      })
    end
  },

}

