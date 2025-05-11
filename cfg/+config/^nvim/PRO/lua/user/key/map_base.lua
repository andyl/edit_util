-- key/map_base - single-key maps

--------------------------------------------------------------------------------
-- Keymap Functions
local opts   = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local function km(mode, key, cmd) keymap(mode, key, cmd, opts) end

-- Remap Functions
function KmN(key, cmd) km("n", key, cmd) end -- normal_mode

function KmI(key, cmd) km("i", key, cmd) end -- insert_mode

function KmV(key, cmd) km("v", key, cmd) end -- visual_mode

function KmT(key, cmd) km("t", key, cmd) end -- terminal_mode

-- LEADER KEY
vim.g.mapleader      = ","
vim.g.maplocalleader = ","

-- PANE NAVIGATION
KmN("<C-h>", "<C-w>h")
KmN("<C-j>", "<C-w>j")
KmN("<C-k>", "<C-w>k")
KmN("<C-l>", "<C-w>l")

KmT("<C-h>", "<C-\\><C-n><C-w>h")
KmT("<C-j>", "<C-\\><C-n><C-w>j")
KmT("<C-k>", "<C-\\><C-n><C-w>k")
KmT("<C-l>", "<C-\\><C-n><C-w>l")

-- PANE RESIZING
KmN("<C-Up>", ":call BarUp(2)<cr>")
KmN("<C-Down>", ":call BarDown(2)<cr>")
KmN("<C-Left>", ":call BarLeft(2)<cr>")
KmN("<C-Right>", ":call BarRight(2)<cr>")

KmT("<C-Up>", "<C-\\><C-n>:call BarUp(2)<cr>")
KmT("<C-Down>", "<C-\\><C-n>:call BarDown(2)<cr>A")
KmT("<C-Left>", "<C-\\><C-n>:call BarLeft(2)<cr>")
KmT("<C-Right>", "<C-\\><C-n>:call BarRight(2)<cr>A")

-- DATE INCREMENT/DECREMENT (SPEEDDATING)

local function zdir(direction)
  local text = "Move to last non-blank and " .. direction
  return { desc = text }
end

keymap("n", "<M-u>", "g_<C-x>",       zdir("decrement")) -- move date up
keymap("n", "<M-o>", "g_<C-a>",       zdir("increment")) -- move date out
keymap("i", "<M-u>", "<esc>g_<C-x>a", zdir("decrement")) -- move date up
keymap("i", "<M-o>", "<esc>g_<C-a>a", zdir("increment")) -- move date out

-- SEARCH HIGHLIGHT

-- turn off hlsearch
vim.cmd "nmap <F4> :set nohlsearch<cr>"
vim.cmd "imap <F4> <esc>:set nohlsearch<cr>i<right>"

-- turn on hlsearch when searching
vim.cmd "nnoremap / :set hlsearch<cr>/"

-- Hide error and notification messages
vim.cmd "nmap <F3> :lua require('notify').dismiss()<cr>"
vim.cmd "imap <F3> <esc>:lua require('notify').dismiss()<cr>i<right>"

-- TRANSITION FROM INSERT TO NORMAL MODE
KmI("jk", "<esc>")
KmI("kj", "<esc>")

-- FAST ARROW TYPING
KmI("|fa", "|> ") -- pipe  forward arrow
KmI("|ra", "<| ") -- pipe  reverse arrow
KmI("~fa", "~> ") -- tilde forward arrow
KmI("~ra", "<~ ") -- tilde reverse arrow
KmI("=fa", ">= ") -- equal forward arrow (GTE)
KmI("=ra", "<= ") -- equal reverse arrow (LTE)
KmI("-fa", "-> ") -- arrow forward arrow
KmI("-ra", "<- ") -- arrow reverse arrow
KmI("=FA", "=> ") -- fat   forward arrow

-- TAB NAVIGATION
KmN("<S-A-Left>",  ":tabprev<cr>")        -- normal mode: previous tab
KmN("<S-A-Right>", ":tabnext<cr>")        -- normal mode: next tab
KmI("<S-A-Left>",  "<esc>:tabprev<cr>")   -- insert mode: previous tab
KmI("<S-A-Right>", "<esc>:tabnext<cr>")   -- insert mode: next tab

-- SNIPPET JUMPS
KmI("<A-j>", "<esc>:lua require('luasnip').jump(1)<cr>")
KmI("<A-k>", "<esc>:lua require('luasnip').jump(-1)<cr>")
