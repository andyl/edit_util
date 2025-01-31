-- key/map_base - single-key maps

local n_opts = {
  mode = "n",             -- NORMAL mode
  prefix = "",            -- no leader key
  buffer = nil,           -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,          -- use `silent` when creating keymaps
  noremap = true,         -- use `noremap` when creating keymaps
  nowait = true,          -- use `nowait` when creating keymaps
}

local keytable = {

  -- ["<c-u>"] = { "<cmd>NvimTreeToggle<cr>", "Explorer0" },
  -- ["<A-I>"] = { "<cmd>NvimTreeToggle<cr>", "Explorer1" },
  -- ["<A-i>"] = { "<cmd>NvimTreeToggle<cr>", "Explorer2" },
  -- ["<C-A-u>"] = { "<cmd>NvimTreeToggle<cr>", "Explorer3" },

}

-- local function unmap(key)
--   pcall(vim.cmd('mapclear "' .. key .. '"'))
-- end

-- unmap("<leader>q")
-- unmap("<C-k>")

if WhichKeyOk then WhichKey.register(keytable, n_opts) end

--------------------------------------------------------------------------------
-- Keymap Functions

local opts   = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local function km(mode, key, cmd) keymap(mode, key, cmd, opts) end

-- Remap Functions
function KmN(key, cmd) km("n", key, cmd) end  -- normal_mode
function KmI(key, cmd) km("i", key, cmd) end  -- insert_mode
function KmV(key, cmd) km("v", key, cmd) end  -- visual_mode
function KmT(key, cmd) km("t", key, cmd) end  -- terminal_mode

-- LEADER KEY
-- keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
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
KmN("<C-Up>",    ":call BarUp(2)<cr>")
KmN("<C-Down>",  ":call BarDown(2)<cr>")
KmN("<C-Left>",  ":call BarLeft(2)<cr>")
KmN("<C-Right>", ":call BarRight(2)<cr>")

KmT("<C-Up>",    "<C-\\><C-n>:call BarUp(2)<cr>")
KmT("<C-Down>",  "<C-\\><C-n>:call BarDown(2)<cr>A")
KmT("<C-Left>",  "<C-\\><C-n>:call BarLeft(2)<cr>")
KmT("<C-Right>", "<C-\\><C-n>:call BarRight(2)<cr>A")

-- SEARCH HIGHLIGHT
-- turn off hlsearch
vim.cmd "nmap <F4> :set nohlsearch<cr>"
vim.cmd "imap <F4> <esc>:set nohlsearch<cr>i<right>"
-- turn on hlsearch when searching
vim.cmd "nnoremap / :set hlsearch<cr>/"
-- disabled because of noisy noice notifications
-- vim.cmd "nmap <F4> :set hlsearch! hlsearch?<cr>"
-- vim.cmd "imap <F4> <esc>:set hlsearch! hlsearch?<cr>i<right>"

-- Hide error and notification messages
vim.cmd "nmap <F5> :lua require('notify').dismiss()<cr>"
vim.cmd "imap <F5> <esc>:lua require('notify').dismiss()<cr>i<right>"

-- TRANSITION FROM INSERT TO NORMAL MODE
KmT("<esc>", "<C-\\><C-n>")         -- terminal mode
KmT(",q",    "<C-\\><C-n>:q<cr>")   -- terminal model quit

KmI("jk", "<esc>")
KmI("kj", "<esc>")

-- KmI(":w", "<esc>:w")
-- KmI(":q", "<esc>:q")

-- SNIPPET JUMPS
KmI("<A-j>", "<esc>:lua require('luasnip').jump(1)<cr>")
KmI("<A-k>", "<esc>:lua require('luasnip').jump(-1)<cr>")
