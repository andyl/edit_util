-- lazy/cmp/core_formatting

local kind_icons = require("user.lazy.cmp.core_icons")
local tw_color   = require("tailwindcss-colorizer-cmp")

local formatting = {
  fields = { "kind", "abbr", "menu" },
  format = function(entry, opts)
    opts.kind = string.format("%s", kind_icons[opts.kind])
    opts.menu = ({
      luasnip  = "[Snippet]",
      nvim_lsp = "[LSP]",
      buffer   = "[Buffer]",
      path     = "[Path]",
    })[entry.source.name]
    return tw_color.formatter(entry, opts)
  end,
}

return formatting
