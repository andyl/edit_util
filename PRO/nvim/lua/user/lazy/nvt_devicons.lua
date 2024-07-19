-- nvt_devicons
--
-- Icons for use by other plugins.
--
-- https://github.com/nvim-tree/nvim-web-devicons
--
-- Run :NvimWebDeviconsHiTest to see all icons and their highlighting.

local config = {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  },
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true,
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,
  -- globally enable "strict" selection of icons - icon will be looked up in
  -- different tables, first by filename, and if not found by extension; this
  -- prevents cases when file doesn't have any extension but still gets some icon
  -- because its name happened to match some extension (default to false)
  strict = true,
  -- same as `override` but specifically for overrides by filename
  -- takes effect when `strict` is true
  override_by_filename = {
    [".gitignore"] = {
      icon = "",
      color = "#ff00ff",
      name = "Gitignore"
    },
    ["docker-compose.yml"] = {
      icon = "",
      color = "#f1502f",
      name = "DkCompose"
    }
  },
  -- same as `override` but specifically for overrides by extension
  -- takes effect when `strict` is true
  override_by_extension = {
    ["log"] = {
      icon = "∋",
      color = "#81e043",
      name = "Log"
    },
    ["pdf"] = {
      icon = "∈",
      color = "#81e043",
      name = "Pdf"
    },
    ["csv"] = {
      icon = "✠",
      color = "#81e043",
      name = "Csv"
    },
    ["toml"] = {
      icon = "✠",
      color = "#81e043",
      name = "Toml"
    },
    ["svg"] = {
      icon = "Ⅱ",
      color = "#81e043",
      name = "Svg"
    },
    ["txt"] = {
      icon = "♠",
      color = "#81e043",
      name = "Txt"
    },
  },
}

local opts = {
  'nvim-tree/nvim-web-devicons',
  config = function() require('nvim-web-devicons').setup(config) end
}

return opts
