local opts = {
  'saghen/blink.cmp',

  -- https://github.com/rafamadriz/friendly-snippets
  dependencies = {
    "rafamadriz/friendly-snippets",
    "moyiz/blink-emoji.nvim",
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
          score_offset = 200,
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
          opts = {
            search_paths = {
              "~/.config/nvim/PRO/snippets/json/list"
            }
          }
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
