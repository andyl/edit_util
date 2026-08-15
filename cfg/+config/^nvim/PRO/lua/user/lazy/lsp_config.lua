-- lsp_config
--

return {
  {
    -- Quickstart configs for NVIM LSP
    -- https://github.com/neovim/nvim-lspconfig
    -- : h lspconfig.txt
    'neovim/nvim-lspconfig'
  },
  {
    -- Color display for CSS & Tailwind classes
    -- https://github.com/NvChad/nvim-colorizer.lua
    -- https://www.youtube.com/watch?v=_NiWhZeR-MY&t=30s
    'NvChad/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup({
        filetypes = {
          '*',
          '!md',
          '!markdown'
        },
        options = {
          parsers = {
            names    = { enable = false },  -- don't highlight words like 'blue'
            css      = true,
            css_fn   = true,
            hex      = { rgb = true, rrggbb = true },
            tailwind = { enable = true },
          },
          display = {
            virtualtext = { char = "■" },
          },
        },
      })
      -- require("colorizer").setup({
      --   suppress_deprecation = true,
      --   user_default_options = {
      --     css         = true,
      --     RGB         = true,
      --     RRGGBB      = true,
      --     tailwind    = true,
      --     virtualtext = "■",
      --   },
      --   filetypes = {
      --     '*',
      --     '!md',
      --     '!markdown'
      --   }
      -- })
    end
  },

}

