-- speeddating
--------------------------------------------------------

-- SpeedDatingFormat - increment/decrement dates with c-x/c-a

vim.cmd "1SpeedDatingFormat %Y %h %d %i"

-- DATE INCREMENT/DECREMENT (SPEEDDATING)

local function zdir(direction)
  local text = "Move to last non-blank and " .. direction
  return { desc = text }
end

-- "g_"    | move to last non-blank character
-- "<C-?>" | increment/decrement

local keymap = vim.api.nvim_set_keymap

keymap("n", "<M-u>", "g_<C-x>",       zdir("decrement")) -- move date up
keymap("n", "<M-o>", "g_<C-a>",       zdir("increment")) -- move date out
keymap("i", "<M-u>", "<esc>g_<C-x>a", zdir("decrement")) -- move date up
keymap("i", "<M-o>", "<esc>g_<C-a>a", zdir("increment")) -- move date out

-- try it!
-- 2025 May 29 Thu
