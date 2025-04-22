local trigger_char = ";"

local opts = {
  'saghen/blink.cmp',

  dependencies = {
    -- "rafamadriz/friendly-snippets", -- https://github.com/rafamadriz/friendly-snippets
    "moyiz/blink-emoji.nvim",       -- https://github.com/moyiz/blink-emoji.nvim
  },

  -- release tag to download pre-built binaries
  version = '1.*',

  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'enter' },

    signature = { enabled = true },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = { documentation = { auto_show = true } },

    sources = {
      default = { 'snippets', 'lsp', 'path', 'emoji', 'buffer' },
      providers = {
        lsp = {
          name = "LSP",
          module = "blink.cmp.sources.lsp",
          max_items = 10,
          min_keyword_length = 2,
          score_offset = 100,
        },
        path = {
          name = "Path",
          module = "blink.cmp.sources.path",
          score_offset = 500,
        },
        snippets = {
          name = "Snippets",
          module = "blink.cmp.sources.snippets",
          score_offset = 50,
          max_items = 8,
          opts = {
            search_paths = {
              "~/.config/nvim/PRO/snippets/json/list"
            }
          },
          -- should_show_items = function()
          --   local col = vim.api.nvim_win_get_cursor(0)[2]
          --   local line = vim.api.nvim_get_current_line():sub(1, col)
          --   local words = vim.split(line, '%s+')
          --   local word = words[#words] or ''
          --   return word:sub(1,1) == trigger_char
          -- end,
          -- transform_items = function(ctx, items)
          --   local _ = ctx
          --   for idx, item in ipairs(items) do
          --     AppendLog(tostring(idx))
          --     AppendTbl(item)
          --   end
          --   return items
          -- end,
        },
        emoji = {
          name = "emoji",
          module = "blink-emoji",
          score_offset = 25,
          opts = { insert = true },
        },
        buffer = {
          name = "Buffer",
          module = "blink.cmp.sources.buffer",
          score_offset = 0,
        },
      },
    },

    cmdline = {
      enabled = true,
      completion = {
        menu = { auto_show = true },
      }
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}

return opts
