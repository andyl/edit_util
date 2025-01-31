-- lazy/cmp/core
--------------------------------------------------------

local opts = {
  { "saadparwaiz1/cmp_luasnip" }, -- https://github.com/saadparwaiz1/cmp_luasnip | :h cmp_luasnip
  { "hrsh7th/cmp-buffer"       }, -- https://github.com/hrsh7th/cmp-buffer       | :h cmp-buffer
  { "hrsh7th/cmp-path"         }, -- https://github.com/hrsh7th/cmp-path         | :h cmp-path
  { "hrsh7th/cmp-nvim-lua"     }, -- https://github.com/hrsh7th/cmp-nvim-lua     | :h TBD
  { "hrsh7th/cmp-nvim-lsp"     }, -- https://github.com/hrsh7th/cmp-nvim-lsp     | :h cmp-nvim-lsp
  {
    -- https://github.com/roobert/tailwindcss-colorizer-cmp.nvim
    -- https://www.youtube.com/watch?v=_NiWhZeR-MY&t=30s
    "roobert/tailwindcss-colorizer-cmp.nvim"
  },

  {
    -- https://github.com/hrsh7th/nvim-cmp
    -- :h cmp
    "hrsh7th/nvim-cmp",
    depends_on = { "roobert/tailwindcss-colorizer-cmp.nvim" },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      cmp.setup({
        mapping = require('user.lazy.cmp.core_mapping'),
        formatting = require('user.lazy.cmp.core_formatting'),
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = {
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select   = false,
        },
        experimental = {
          ghost_text  = false,
          native_menu = false,
        },
      })
    end,
  },

  {
    -- https://github.com/hrsh7th/cmp-cmdline
    -- :h cmp-cmdline
    "hrsh7th/cmp-cmdline",
    config = function()
      local cmp = require('cmp')
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        },
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
          },
          {
            {
              name = 'cmdline',
              option = {
                ignore_cmds = { 'Man', '!' }
              }
            }
          })
      })
    end
  },
}

return opts

