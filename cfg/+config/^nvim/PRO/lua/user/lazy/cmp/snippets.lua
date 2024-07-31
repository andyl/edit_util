-- lazy/cmp/snippets
--
-- Snippets
--
-- LuaSnip
-- https://github.com/L3MON4D3/LuaSnip
--
-- cmp_luasnip
-- https://github.com/saadparwaiz1/cmp_luasnip

local opts = {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",        -- optional
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load()
    end
  },
  {
    'saadparwaiz1/cmp_luasnip'
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('cmp').setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
        sources = {
          { name = 'luasnip' },
          -- more sources
        },
      }
    end
  }
}

return opts
