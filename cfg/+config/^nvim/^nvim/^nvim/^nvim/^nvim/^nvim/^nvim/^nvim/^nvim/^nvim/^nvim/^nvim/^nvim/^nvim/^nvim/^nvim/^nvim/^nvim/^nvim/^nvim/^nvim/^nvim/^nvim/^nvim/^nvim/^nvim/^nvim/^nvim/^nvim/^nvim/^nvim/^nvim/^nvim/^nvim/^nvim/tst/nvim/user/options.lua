-- options
--------------------------------------------------------

-- :options      | interactive sandbox
-- :help options | help

local vo = vim.opt
local vg = vim.g

-- MISC OPTIONS
vo.clipboard      = "unnamedplus"           -- allows neovim to access the system clipboard
vo.cmdheight      = 1                       -- more space in the neovim command line for displaying messages
vo.completeopt    = {"menuone", "noselect"} -- mostly just for cmp
vo.conceallevel   = 0                       -- so that `` is visible in markdown files
vo.fileencoding   = "utf-8"                 -- the encoding written to a file
vo.mouse          = "a"                     -- allow the mouse to be used in neovim
vo.pumheight      = 10                      -- pop up menu height
vo.showmode       = false                   -- don't show things like -- INSERT -- anymore
vo.showtabline    = 1                       -- only if there are two or more tabs
vo.smartcase      = true                    -- smart case
vo.smartindent    = true                    -- make indenting smarter again
vo.termguicolors  = true                    -- set term gui colors (most terminals support this)
vo.timeoutlen     = 1000                    -- time to wait for a mapped sequence to complete (in milliseconds)
vo.undofile       = true                    -- enable persistent undo
vo.updatetime     = 300                     -- faster completion (4000ms default)
vo.expandtab      = true                    -- convert tabs to spaces
vo.tabstop        = 2                       -- insert 2 spaces for a tab
vo.shiftwidth     = 2                       -- the number of spaces inserted for each indentation
vo.cursorline     = false                   -- highlight the current line
vo.numberwidth    = 4                       -- set number column width to 2 {default 4}
vo.signcolumn     = "yes"                   -- always show the sign column
vo.wrap           = false                   -- display lines as one long line
vo.scrolloff      = 8                       -- scroll offset
vo.sidescrolloff  = 8
vo.guifont        = "monospace:h17"         -- the font used in graphical neovim applications
vo.virtualedit    = "block"                 -- useful for block edit at end of line
-- PANE OPTIONS
vo.splitbelow     = true                    -- horizontal splits go below current window
vo.splitright     = true                    -- vertical splits go to the right of current window
-- SEARCH OPTIONS
vo.hlsearch       = true                    -- highlight all matches on previous search pattern
vo.ignorecase     = true                    -- ignore case in search patterns
-- FILE BACKUP OPTIONS
vo.backup         = false                   -- creates a backup file
vo.writebackup    = false                   -- if file is open in another program, editing not allowed
vo.swapfile       = false                   -- creates a swapfile
-- LINE NUMBERING OPTIONS
vo.number         = true                    -- set numbered lines
vo.relativenumber = false                   -- set relative numbered lines
-- NVIM PROVIDER OPTIONS
vg.loaded_perl_provider = 0                 -- disable perl provider

