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
    event = { "BufReadPost", "BufNewFile" },
    version = "v2.*",
    build = "make install_jsregexp", -- optional
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load()

      local ls = require("luasnip")

      -- <Ctrl-K> to expand
      -- <Ctrl-L> to jump forward
      -- <Ctrl-J> to jump backward
      -- <Ctrl-E> to change active choice

      vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })

    end
  },
  {
    'saadparwaiz1/cmp_luasnip',
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    'hrsh7th/nvim-cmp',
    event = { "BufReadPost", "BufNewFile" },
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
