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

-- TO ALIGN: "-ca"
--
-- Arrow Forward "-f"
-- a -> b -> c
-- aa -> bb -> cc
--
-- Arrow Reverse "-r"
-- a <- b <- c
-- aa <- bb <- cc
--
-- Pipe Forward "|f"
-- a |> b |> c
-- aa |> bb |> cc
--
-- Pipe Reverse "|r"
-- a <| b <| c
-- aa <| bb <| cc
--
-- Tilde Forward "~f"
-- a ~> b ~> c
-- aa ~> bb ~> cc
--
-- Tilde Reverse "~r"
-- a <~ b <~ c
-- aa <~ bb <~ cc
--
-- Equals Forward "=f"
-- a >= b >= c
-- aa >= bb >= cc
--
-- Equals Reverse "=r"
-- a <= b <= c
-- aa <= bb <= c

return 'junegunn/vim-easy-align'
