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

keymap("n", "<C-u>", "g_<C-x>",       zdir("decrement"))
keymap("n", "<C-o>", "g_<C-a>",       zdir("increment"))
keymap("i", "<C-u>", "<esc>g_<C-x>a", zdir("decrement"))
keymap("i", "<C-o>", "<esc>g_<C-a>a", zdir("increment"))

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
-- KmT("<esc>", "<C-\\><C-n>")         -- terminal mode
-- KmT(",q",    "<C-\\><C-n>:q<cr>")   -- terminal mode quit

KmI("jk", "<esc>")
KmI("kj", "<esc>")

-- KmI(":w", "<esc>:w")
-- KmI(":q", "<esc>:q")

-- SNIPPET JUMPS
KmI("<A-j>", "<esc>:lua require('luasnip').jump(1)<cr>")
KmI("<A-k>", "<esc>:lua require('luasnip').jump(-1)<cr>")
