-- edit_easy_align
--
-- A Vim alignment plugin.  Align text into columns.
--
-- https://github.com/junegunn/vim-easy-align
-- :help easy-align
-- :EasyAlign ...
--
-- See key definitions in `lua/user/key/map_a.lua` (jump using keymap `gfs`)

vim.g.easy_align_delimiters = {

  aa = {                    -- all arrows
    pattern      = [[->\|<-\|<|\||>\|\~>]],
    left_margin  = 1,
    right_margin = 1,
  },

}

return 'junegunn/vim-easy-align'
