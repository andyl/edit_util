-- edit_easy_align
--
-- A Vim alignment plugin.  Align text into columns.
--
-- https://github.com/junegunn/vim-easy-align
-- :help easy-align
-- :EasyAlign ...
--
-- See key definitions in `map_base.lua`
-- See the WhichKey keymaps in `map_dash.lua`

local arrows = table.concat({
  "->",
  "<-",
  "|>",
  "<|",
  "\\~>",
  "<\\~",
  ">=",
  "<=",
  "=>",
}, "\\|")

vim.g.easy_align_delimiters = {

  aa = {                    -- all arrows
    pattern = arrows,
    left_margin  = 1,
    right_margin = 1,
  },

}

return 'junegunn/vim-easy-align'
