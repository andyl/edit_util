-- speeddating
--------------------------------------------------------

-- SpeedDatingFormat - increment/decrement dates with c-x/c-a
-- https://github.com/tpope/vim-speeddating

vim.cmd "1SpeedDatingFormat %Y %h %d %i"

-- DATE INCREMENT/DECREMENT (SPEEDDATING)

local function zdir(direction)
  local text = "Move to last non-blank and " .. direction
  return { desc = text }
end

-- "g_"    | move to last non-blank character
-- "<C-x>" | increment
-- "<C-a>" | decrement

local keymap = vim.api.nvim_set_keymap

keymap("n", "<M-u>", "g_<C-x>",       zdir("decrement")) -- move date up
keymap("n", "<M-o>", "g_<C-a>",       zdir("increment")) -- move date out
keymap("i", "<M-u>", "<esc>g_<C-x>a", zdir("decrement")) -- move date up
keymap("i", "<M-o>", "<esc>g_<C-a>a", zdir("increment")) -- move date out

-- try it!
--
-- 2025 May 29 Thu
--
-- Fri, 31 Dec 1999 23:59:59 +0000
-- Fri Dec 31 23:59:59 UTC 2001
-- 2008-01-05T04:59:59Z
-- 1865-04-14
-- 11/Sep/01
-- January 14th, 1983
-- 11:55 AM
-- 3rd
-- XXXVIII

