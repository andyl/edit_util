-- nvt_yazi
--
-- Yazi File Browser
--
-- https://github.com/mikavilpas/yazi.nvim

local opts = {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  opts = {
    -- open yazi instead of netrw
    open_for_directories = true,

    -- enable these if you are using the latest version of yazi
    -- use_ya_for_events_reading = true,
    -- use_yazi_client_id_flag = true,

    keymaps = {
      show_help                            = '<f1>',
      open_file_in_vertical_split          = '<c-v>',
      open_file_in_horizontal_split        = '<c-s>',
      open_file_in_tab                     = '<c-t>',
      copy_relative_path_to_selected_files = '<c-y>',
    },

  },
}

return opts
